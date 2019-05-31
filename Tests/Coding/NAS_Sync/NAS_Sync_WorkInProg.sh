#!/bin/bash
#Skeleton for syncing a Hot Folder to our NAS
#1) Copies files from Hot Folder on Mac1/Mac2 to Mac3 (networked to NAS)
#2) Looks for and deletes hidden files
#3) Creates new directories for the aips and access files
#4) Changes the videoaip settings to target these new directories
#5) Runs videoaip on all files in the "Landing directory"
#6) Syncs the new AIP and access file directories to any additional NAS locations
#7) Deletes any items in the "Landing directory" on NAS that have been accessed in the past day - so it should be empty.
#8) Generates a text list of items that have been accessed within the past day on all NAS locations. Outputs this list to Mac1 or Mac2 desktop. 

ssh mipopsmac1@10.5.74.221
while read TARGET
do rsync -av "$TARGET" ssh mipopsadmin@  </dev/null
done < <(find REMOTEPATH/Users/mipopsmac1/Desktop/PIs/*/* -type d -mmin -480)
#Look in desktop PI folder on Mac1. Find any files less than 8 hours old. Rsync them to NAS Landing folder.
#TROUBLE CONNECTING? Check the IP address for the remote path. It may have changed.

ssh mipopsmac1@10.5.65.121
while read TARGET
do rsync -av "$TARGET" ssh mipopsadmin@ </dev/null
done < <(find REMOTEPATH/Users/mipopsmac2/Desktop/PIs/*/* -type d -mmin -480)
#Look in desktop PI folder on Mac2. Find any files less than 8 hours old. Rsync them to NAS Landing folder.
#TROUBLE CONNECTING? Check the IP address for the remote path. It may have changed.

ssh mipopsadmin@
cd Desktop/LANDING
find "$PWD" -iname "*._*" -delete
#look in landing folder for hidden files and delete them

aip_output_dir="MAC3/AIPS/AIPS_$(date +%Y_%d_%m)"
mkdir "$aip_output_dir"
#create AIP target directory - OUTSIDE of the landing folder. Folder will be called AIPS_YYY_DD_MM.

access_output_dir="MAC3/ACCESS/Access_$(date +%Y_%d_%m)"
mkdir "$access_output_dir"
#create access file target directory - OUTSIDE of the landing folder. Folder will be called Access_YYY_DD_MM.

videoaip -sa [sync aips] y "$aip_output_dir"
#THIS IS MADE UP AND DOESN'T WORK YET. tell videoaip to sync aips to aip target directory
videoaip -ra [remove original aips after sync] y
#THIS IS MADE UP AND DOESN'T WORK YET. tell videoaip to remove original aips after syncing
videoaip -sc [sync access] y "$access_output_dir"
#THIS IS MADE UP AND DOESN'T WORK YET. tell videoaip to sync the access files to access file target directory

while read TARGET
do videoaip -l auto "$TARGET" </dev/null
done < <(find "$PWD" -name '*.mkv')
#run videoaip on all mkv files in the landing directory

rsync -av "$aip_output_dir" /ADDL/NAS350FA2/DataVol1
#sync the new AIP folders to all NAS locations

rsync -av "$access_output_dir" /ADDL/NAS350FA2/DataVol1
#sync the new AIP folders to all NAS locations

cd MAC3/LANDINGFOLDER
find "$PWD" -atime -1 -type f -delete
#delete items in "Landing Folder"

cd /ADDL/NAS350FA2/DataVol1
find "$PWD" -atime -1 -type f > ssh mipopsadmin@ REMOTEPATH/Users/mipopsadmin/Desktop/"NAS1_list_$(date +%Y_%d_%m).txt"
#Generate a list of files on NAS location x which were accessed during the past day (-atime -1 = accessed time, 1 day). Export this file to location on MAC1/MAC2 desktop.


