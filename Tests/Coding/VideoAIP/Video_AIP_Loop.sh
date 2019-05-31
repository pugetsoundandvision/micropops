#!/bin/bash 
#Loop for creating AIPS using VideoAIP
#This will only AIP MKVs.

find /PATH/TO/DIR -iname "*.mkv"
while read TARGET
do videoaip -l auto "$TARGET" </dev/null
done < <(find /SAME/PATH/AS/ABOVE -name '*.mkv')
