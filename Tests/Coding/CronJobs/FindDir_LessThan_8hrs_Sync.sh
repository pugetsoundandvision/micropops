#!/bin/bash
#Finds all directories in Desktop PI folder younger than 8 hours and syncs them to PI directory on M2DHD.

# while read TARGET
# do rsync -av "$TARGET" /Volumes/MAC2_DHD/PIs </dev/null
# done < <(find /Users/mipopsmac2/Desktop/PIs/*/*/ -type d -mmin -480)
### Syncs too many things, all the way to the user folder

# while read TARGET
# do rsync -av "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
# done < <(find /Users/mipopsmac2/Desktop/PIs/*/*/ -type d -mmin -480)
### only sends the FILE, not the folder it's in

# while read TARGET
# do rsync -avR "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
# done < <(find /Users/mipopsmac2/Desktop/PIs/*/*/ -type d -mmin -480)
### syncs too many folders, all the way back to the user folder

while read TARGET
do rsync -av "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
done < <(find /Users/mipopsmac2/Desktop/PIs/*/*/ -type f -mmin -480)
### syncs just the file, not its containing folder

# rsync -a /Users/mipopsmac2/Desktop/PIs/Donald_Byrd/ /Users/mipopsmac2/Desktop/NAS_Fake_1
#this works fine
