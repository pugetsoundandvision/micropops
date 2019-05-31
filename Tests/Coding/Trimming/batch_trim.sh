#!/bin/bash

ffmpeg -i Copy_1432.mkv -ss 00:00:00 -t 00:10:44 -acodec copy -vcodec copy Copy_1432_TRIM.mkv;

ffmpeg -i Copy_1452.mkv -ss 00:00:00 -t 00:26:53 -acodec copy -vcodec copy Copy_1452_TRIM.mkv;

ffmpeg -i Copy_1456.mkv -ss 00:00:00 -t 00:06:47 -acodec copy -vcodec copy Copy_1456_TRIM.mkv;

ffmpeg -i Copy_1471.mkv -ss 00:00:00 -t 00:05:28 -acodec copy -vcodec copy Copy_1471_TRIM.mkv;

ffmpeg -i Copy_1475.mkv -ss 00:00:00 -t 00:05:47 -acodec copy -vcodec copy Copy_1475_TRIM.mkv;

ffmpeg -i Copy_1436.mkv -ss 00:00:00 -t 00:16:54 -acodec copy -vcodec copy Copy_1436_TRIM.mkv;

done