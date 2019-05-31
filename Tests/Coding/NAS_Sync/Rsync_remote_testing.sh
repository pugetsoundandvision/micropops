#!/bin/bash

REMOTE SYNC TESTING

MIPoPSs-Mac-mini-2:~ mipopsmac1$ rsync -av ssh /Users/mipopsmac1/Desktop/LTO_Test/ mipopsmac2@10.5.74.221:/Users/mipopsmac2/Desktop/NAS_Fake_1
Enter passphrase for key '/Users/mipopsmac1/.ssh/id_rsa': 
building file list ... 
rsync: link_stat "/Users/mipopsmac1/ssh" failed: No such file or directory (2)
done
./
.DS_Store
LTO_Manifest3.txt
Move_Here/
Move_Here/.DS_Store
Move_Here/SAM_2019_T013_TCrabs.mkv


[THIS WORKS, BUT IT GIVES THAT ERROR 'NO SUCH FILE OR DIRECTORY'. PROMPTS FOR PASSWORD.]

##here I moved the ssh from before the first source to before the destination
mipopsmac1$ rsync -av /Users/mipopsmac1/Desktop/LTO_Test/ ssh mipopsmac2@10.5.74.221:/Users/mipopsmac2/Desktop/NAS_Fake_1
Enter passphrase for key '/Users/mipopsmac1/.ssh/id_rsa': 
building file list ... 
rsync: link_stat "/Users/mipopsmac1/ssh" failed: No such file or directory (2)
done
./
.DS_Store
LTO_Manifest3.txt
Move_Here/
Move_Here/.DS_Store
Move_Here/SAM_2019_T013_TCrabs.mkv

#created /Users/mipopsmac1/ssh directory. rsync: link_stat "/Users/mipopsmac1/ssh" failed: No such file or directory (2) is RESOLVED. BUT!!! Rsync now moves an empty ssh directory over the to destination.
