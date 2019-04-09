#!/bin/bash

/Users/mipopsmac2/Desktop/expect_Script.sh
#call the expect script to sync items from Mac1 to host
cd /Users/mipopsmac2/Desktop/NAS_Fake_1
find "$PWD" -atime -1 -type f > /Users/mipopsmac2/Desktop/"NAS1_list_$(date +%Y_%d_%m).txt"

