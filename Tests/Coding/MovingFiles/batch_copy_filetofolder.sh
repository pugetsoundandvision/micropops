#!/bin/bash

for i in *.mp4;

do ffmpeg -i ${i} /Volumes/MAC1_DHD/MOHAI/${i%.*}/${i%.*}.mp4;

done