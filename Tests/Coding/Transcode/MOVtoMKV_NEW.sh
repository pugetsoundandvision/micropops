#!/bin/bash

for i in *.mov;

do ffmpeg -i ${i} -c:v ffv1 -level 3 -coder 1 -g 1 -slices 24 -slicecrc 1 -c:a pcm_s24le ${i%.*}.mkv;

done