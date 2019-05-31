#!/bin/bash
# EDITED TEST!!! 

rsync -a /Users/mipopsmac2/Desktop/AIP_TEST/* /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing
#Uses rsync to copy the contents of the Hot Folder to the NAS location. The option -v (after rsync) will make the command verbose.
cd /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing
find "$PWD" -iname "*._*" -delete
#look in landing folder for hidden files and delete
aip_output_dir="/Users/mipopsmac2/Desktop/NAS_Fake_1/AIPS_$(date +%Y_%d_%m)"
mkdir "$aip_output_dir"
#create aip target directory - OUTSIDE of the landing folder. Folder will be called AIPS_YYY_DD_MM.
access_output_dir="/Users/mipopsmac2/Desktop/NAS_Fake_1/Access_$(date +%Y_%d_%m)"
mkdir "$access_output_dir"
#create access file target directory - OUTSIDE of the landing folder. Folder will be called Access_YYY_DD_MM.
while read TARGET
do videoaip -l auto "$TARGET" </dev/null
done < <(find "$PWD" -name '*.mkv')
#run videoaip on all mkv files in the landing directory
while read TARGET
do rsync -a "$TARGET" "$access_output_dir"
done < <(find /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing -name '*mp4')
while read TARGET
do rsync -a "$TARGET" "$aip_output_dir"
done < <(find /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/*/* -maxdepth 0 -type d)
rsync -a "$aip_output_dir" /Users/mipopsmac2/Desktop/NAS_Fake_2
#sync the new aip folders to all NAS locations
rsync -a "$access_output_dir" /Users/mipopsmac2/Desktop/NAS_Fake_2
#sync the new aip folders to all NAS locations
cd /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing
find "$PWD" -atime -1 -type f -delete
#-type f deletes all the files. Try -type d to delete all the directories.
#delete items in "Landing Folder"
