#!/bin/bash

for i in *.mov;

do ffmpeg -i ${i} -c:v ffv1 -level 3 -coder 0 -pix_fmt yuv422p10 -slices 16 -slicecrc 1 -c:a pcm_s24le ${i%.*}.mkv;

done