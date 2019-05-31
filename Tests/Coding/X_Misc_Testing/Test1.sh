#!/bin/bash
find /Users/mipopsmac2/Desktop/AIP_TEST -type f
while read TARGET
do mv "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1
done