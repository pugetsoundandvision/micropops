#!/bin/bash

## Look in PI folder on MAC1. Find any files less than 8 hours old. Sync them to Local Host.
# 1) enter mac 1 using an expect script [M1_to_M3_Expect]
# 2) from inside that script, run the following loop [Mac1_PI_to_Mac3]

### rsync -av mipopsmac1@10.5.65.121:/Users/mipopsmac1/Desktop/PIs/*/* -type d -mmin -480 /Users/mipopsmac2/Desktop/NAS_Fake_1 
# rsync: Failed to exec d: No such file or directory (2)
# rsync error: error in IPC code (code 14) at pipe.c(85) [Receiver=3.1.3]
# rsync: connection unexpectedly closed (0 bytes received so far) [Receiver]
# rsync error: error in rsync protocol data stream (code 12) at io.c(226) [Receiver=3.1.3]

### rsync -av mipopsmac1@10.5.65.121:/Users/mipopsmac1/Desktop/PIs/*/* -mmin -480 /Users/mipopsmac2/Desktop/NAS_Fake_1
# generated a list of everything in the PI folders, but ran it as a DRY RUN

### rsync -avn mipopsmac1@10.5.65.121:/Users/mipopsmac1/Desktop/PIs/*/* /Users/mipopsmac2/Desktop/NAS_Fake_1
# generated a list of everything in the PI folders, but ran it as a DRY RUN

ssh mipopsmac1@10.5.65.121
while read TARGET
do rsync -av "$TARGET" /Users/mipopsmac2/Desktop/NAS_Fake_1 </dev/null
done < <(find mipopsmac1@10.5.65.121:/Users/mipopsmac1/Desktop/PIs/*/* -type d -mmin -480)

find /Users/mipopsmac1/Desktop/PIs/*/* -type d -mmin -480 | while read TARGET ; do mv -v "$TARGET" /Users/mipopsmac1/Desktop/LAN_TEST

# MASTER SCRIPT
#1) call [M1_to_M3_Expect] - this syncs m1 pi to m3
#2) call [M2_to_M3_Expect] - this syncs m2 pi to m3
#3) run the rest of the script (hidden files, vrecord, etc)
#4) at the end, run another expect script to have the file list generated to m1 m2 desktop