#!/bin/bash

#while read TARGET
#do rsync -av "$TARGET" [DESTINATION]
#done < <(find "$PWD" -iname "*.mp4")

while read TARGET
do rsync -av "$TARGET" /Volumes/MAC2_DHD/PIs/WLM/00_Access
done < <(find "$PWD" -iname "*.mp4")