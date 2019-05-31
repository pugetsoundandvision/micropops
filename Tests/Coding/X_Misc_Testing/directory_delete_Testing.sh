#!/bin/bash

cd /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing ; find "$PWD" -atime -1 -type d -delete
MIPoPSs-Mac-mini:Landing mipopsmac2$ cd /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing ; find "$PWD" -atime -1 -type d -delete
find: -delete: /Users/mipopsmac2/Desktop/NAS_Fake_1/Landing: relative path potentially not safe
#DOESNT DELETE ANYTHING

MIPoPSs-Mac-mini:Landing mipopsmac2$ find "$PWD" -type d
#Generates list of all directories but INCLUDES THE WORKING DIRECTORY
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM

MIPoPSs-Mac-mini:Landing mipopsmac2$ find "$PWD" -atime -1 -type d
#Generates list of all directories but INCLUDES THE WORKING DIRECTORY
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM


MIPoPSs-Mac-mini:Landing mipopsmac2$ find "$PWD" -mindepth 1 -type d
#Generates list of all directories and excludes working directory
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM

MIPoPSs-Mac-mini:Landing mipopsmac2$ find "$PWD" -mindepth 1 -type d -delete
#Does nothing

MIPoPSs-Mac-mini:Landing mipopsmac2$ find "$PWD" -atime -1 -type f
#Generates list of all files (-type f)
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1/.DS_Store
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1/AIP_TEST1.framemd5
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1/AIP_TEST1_ffmpeg_decklink_input.log
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/AIP_TEST1/AIP_TEST1_capture_options.log
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/.DS_Store
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM/AIP_TEST3.mp4
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM/AIP_TEST2.mp4
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.36 PM/AIP_TEST1.mp4
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM/AIP_TEST3.mp4
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM/AIP_TEST2.mp4
/Users/mipopsmac2/Desktop/NAS_Fake_1/Landing/Access_2019_28_03 1.00.44 PM/AIP_TEST1.mp4
