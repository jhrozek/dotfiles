#!/bin/bash

MAILBOXES_FILE=~/.muttrc_mbsync_mboxes
FOLDER=/home/remote/jhrozek/.maildir/Inbox/

while true
do
    mbsync -a
    echo -n "mailboxes " > $MAILBOXES_FILE
    find $FOLDER -type d -name cur -printf '%h ' >> $MAILBOXES_FILE
    sleep 120
done
