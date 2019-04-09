#!/bin/bash #Loop for creating AIPS using VideoAIP

find /Users/mipopsmac2/Desktop/AIP_TEST -iname "*.mkv"
while read TARGET
do videoaip -l auto "$TARGET" </dev/null
done < <(find /Users/mipopsmac2/Desktop/AIP_TEST -name '*.mkv')
