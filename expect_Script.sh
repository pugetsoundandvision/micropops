#!/usr/bin/expect
set timeout -1 
#spawn /Users/mipopsmac2/Desktop/rsync_testing.sh
spawn /Users/mipopsmac2/Desktop/Test_sync_timeout.sh
expect -exact "Enter passphrase for key '/Users/mipopsmac2/.ssh/id_rsa':"
send -- "seattle\r"
expect -exact "Enter passphrase for key '/Users/mipopsmac2/.ssh/id_rsa':"
send -- "seattle\r"
expect -exact "Enter passphrase for key '/Users/mipopsmac2/.ssh/id_rsa':"
send -- "seattle\r"
expect eof

## After supplying the password, the expect script CLOSES [expect eof] and the host returns to LOCAL.