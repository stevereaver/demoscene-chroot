#!/bin/bash
####################################################################
##
## Remote mount points for chroot environment
##
###################################################################

. ./config.sh

umount -R $DIR/proc 
umount -R $DIR/sys
umount -R $DIR/dev
