#!/bin/bash
#Finds files in one folder that are less than 8 hours old (480=60x8, change this if you want to find files that are less than X hours old. For items OVER x hours, use -mmin +480, which would be files OVER 8 hours old)
#Then copies them to a new location
#avzh still only syncs the file, not the folders
#aR syncs the ENTIRE folder path (all the way to User)
#rsync -av "$(dirname "$TARGET")"
#that is a little inefficient cuz it will run rsync for every file in that folder but the extra times it will just be like "oh, already there" and will skip

while read TARGET
do echo "$TARGET" </dev/null
done < <(find /Users/mipopsmac2/Desktop/AIP_TEST -type f -mmin -480)