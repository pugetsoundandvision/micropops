#!/bin/bash

for i in `find . -type f -name *.mp4';

do mv ${i} /Volumes/MAC2_DHD/MOHAI/${i%.*}/folder.mp4;

done