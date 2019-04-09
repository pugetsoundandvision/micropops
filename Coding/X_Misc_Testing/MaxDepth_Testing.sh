#!/bin/bash

### Testing using MAXDEPTH to list the directories or subdirectories you want  ###
# Test with different combinations of * and maxdepth to get the depth you need

find /Users/mipopsmac2/Desktop/AIP_TEST/* -maxdepth 2 -type d
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1/AIP_TEST1
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1/AIP_TEST1/data
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2/AIP_TEST2
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2/AIP_TEST2/data
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3/AIP_TEST3
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3/AIP_TEST3/data
/Users/mipopsmac2/Desktop/AIP_TEST/Move_Test
/Users/mipopsmac2/Desktop/AIP_TEST/Move_Test/Newer_Folder_Than_Dir
/Users/mipopsmac2/Desktop/AIP_TEST/OnlyNewAIPS

find /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST*/ -maxdepth 1 -type d
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1/
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1//AIP_TEST1
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2/
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2//AIP_TEST2
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3/
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3//AIP_TEST3


# This lists just the subdirectories (the actual AIPS)
find /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST*/* -maxdepth 0 -type d
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST1/AIP_TEST1
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST2/AIP_TEST2
/Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST3/AIP_TEST3
