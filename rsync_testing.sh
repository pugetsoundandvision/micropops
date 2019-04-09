#!/bin/bash
rsync -av mipopsmac1@10.5.65.121:/Users/mipopsmac1/Desktop/LTO_Test/Move_Here /Users/mipopsmac2/Desktop/NAS_Fake_1
#sync directory from remote computer to local computer
# cd /Users/mipopsmac2/Desktop/.  
# pwd
### <-- These two tests helped me determine that after entering the password, the expect script exits and returns to the LOCAL HOST.

