#!/bin/bash
#Sync folder contents from location on desktop to location on external HD

rsync -a /Users/mipopsmac2/Desktop/PIs/WLM /Volumes/MAC2_DHD/PIs/WLM
rsync -a /Users/mipopsmac2/Desktop/PIs/SAM /Volumes/MAC2_DHD/PIs/SAM

find -mtime -2

rsync -RDa0P --files-from=Users/mipopsmac2/Desktop/AIP_TEST -mtime -2 -print0 /Users/mipopsmac2/Desktop/NAS_Fake_1

find /Users/mipopsmac2/Desktop/AIP_TEST/ -mtime -2 -print0

rsync --files-from=<(find /Users/mipopsmac2/Desktop/AIP_TEST -type f -newer "datestamp" -print0)

1554139800  time stamp for 4/1/19 10:00 am

touch -mt 09301300 /Users/mipopsmac2/Desktop/AIP_TEST/

find / -newer /Users/mipopsmac2/Desktop/AIP_TEST/ -print

touch -mt 1554139800 /Users/mipopsmac2/Desktop/AIP_TEST/file

find /Users/mipopsmac2/Desktop/AIP_TEST/NEW_ITEM -newer /Users/mipopsmac2/Desktop/AIP_TEST/file -print

find /Users/mipopsmac2/Desktop/AIP_TEST -type f -mmin -$((60*8))
# Lists all files created within the last 8 hours

while read TARGET
do rsync -a "$TARGET" </dev/null
done < <(find /Users/mipopsmac2/Desktop/AIP_TEST -type f -mmin -$((60*8))

| rsync -a /Users/mipopsmac2/Desktop/AIP_TEST/NEW_ITEM

-exec cp -a "{}" /Users/mipopsmac2/Desktop/AIP_TEST/NEW_ITEM \;