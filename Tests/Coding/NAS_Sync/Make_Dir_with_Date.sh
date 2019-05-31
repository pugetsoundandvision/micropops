#!/bin/bash

cd /Users/mipopsmac2/Desktop/AIP_TEST
#CDs into x directory
outputdir="$PWD/AIPS_$(date +%Y_%m_%d)"
#defines [target]=[Print working directory]/NewName_Year_Month_Date
mkdir "$outputdir"
#Make directory called [Target]