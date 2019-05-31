#!/usr/bin/expect

set timeout -1
# this stops the expect script from timing out before the operations are done. 

spawn /Users/mipopsmac2/Desktop/Sync_9Apr.sh
expect -exact "Enter passphrase for key '/Users/mipopsmac2/.ssh/id_rsa':"
send -- "seattle\r"
expect eof