#!/bin/bash
#Finds files in X folder that are less than 8 hours old (480=60x8, change this if you want to find files that are less than X hours old. For items OVER x hours, use -mmin +480, which would be files OVER 8 hours old)
#Then uses rsync to copy them to a second location

while read TARGET
do rsync -a "$TARGET" /Volumes/MAC2_DHD/PIs </dev/null
#use rsync to move them to [THIS DIRECTORY]
done < <(find /Users/mipopsmac2/Desktop/PIs -type f -mmin -480)
#find files in [THIS DIRECTORY]