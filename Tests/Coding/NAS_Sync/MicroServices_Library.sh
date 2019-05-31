#!/bin/bash

### TESTING MV ###
find /Users/mipopsmac2/Desktop/AIP_TEST -type d
while read TARGET
do mv "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
done
#DOES NOT WORK
#Find directories in [This directory]
#move these directories to [New directory]

find /Users/mipopsmac2/Desktop/AIP_TEST -type f
while read TARGET
do mv "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
done
#DOES NOT WORK, use RSYNC instead

### Move all subdirectories to another location ###
mv /Users/mipopsmac2/Desktop/AIP_TEST/* /Users/mipopsmac2/Desktop/NAS_Fake_1
#This moves all items in directory AIP_TEST into target directory NAS_FAKE_1
#The asterix after AIP_TEST/* allows all internal directories and files to be moved, but preserves the location of the parent directory. Removing the * results in the entire AIP_TEST directory being moved into the target directory.

### Move an entire directory to another location ###
mv /Users/mipopsmac2/Desktop/AIP_TEST/ /Users/mipopsmac2/Desktop/NAS_Fake_1

### Create a file of any name and extension. ###
touch /Users/mipopsmac2/Desktop/NAS_Fake_1/Hidden._txt
#creates a file in [Directory] named Hidden._txt

### Find and delete hidden files ###
cd /Users/mipopsmac2/Desktop/NAS_Fake_1
find $PWD -iname "*._*" -delete
#CD into [target directory]
#Find "*._*" in working directory and delete them. Remove [-delete] to just generate list of hidden files.

### TESTING RSYNC ###
rsync /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1 /Users/mipopsmac2/Desktop/NAS_Fake_1 
# NOTHING HAPPENS

rsync -a /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1 /Users/mipopsmac2/Desktop/NAS_Fake_1
# Syncs directory AIP_TEST1 and all internal files to target location.
# A tag = Archive 

rsync -a -v /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1 /Users/mipopsmac2/Desktop/NAS_Fake_1 
# Syncs directory AIP_TEST1 and all internal files to target location.
# V (VERBOSE) tag generates a list of everything in AIP_TEST1 before moving it.

rsync -av /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1 /Users/mipopsmac2/Desktop/NAS_Fake_1 
# Syncs directory AIP_TEST1 and all internal files to target location.
# V (VERBOSE) tag generates a list of everything in AIP_TEST1 before moving it.
#Combined both flags together (a and v)

while read TARGET
do videoaip -l auto "$TARGET" </dev/null
#Make sure videoaip settings are set to sync AIP to new location, to remove original AIP
done < <(find "$PWD" -name '*.mkv')
#Notice the double quotes here. Single quotes tell the computer to read the information literally. Double quotes tell it to allow whats inside to be executed. Double quotes allow for 'variable execution', meaning that whatever is IN the variable should be executed. In this case, we're telling the computer to substitute whatever the value of $PWD is in the actual command it runs.

### Define and then create a new directory ###
outputdir="$PWD/AIPS_$(date +%Y_%m_%d)"
mkdir "$outputdir"
#Defines a new directory with a date stamp.
#Makes that directory.

### RSYNC a target ###
rsync -a "$outputdir" /Users/mipopsmac2/Desktop/NAS_Fake_1
#Uses rsync to copy the output directory (created above) to another location

### BASIC STRUCTURE FOR LOOPS ### 
while read TARGET
do videoaip -l auto "$TARGET" </dev/null
done < <(find "$PWD" -name '*.mkv')
## In loops, you describe the action that you want to take, and THEN describe the target. 
## While reading [x], do [this command]. < <(DEFINE THE TARGET IN HERE)

### Another structure for loops ### 
while read TARGET ; do echo "$TARGET" ; done < <(find . -iname "*.tif")
#An example of the correct way to use loops, where the FIND command comes at the end.
#<(some command is making a 'virtual file' and then reading the lines from that file one by one - in this case, the output of find.