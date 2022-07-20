#!/bin/bash
####################################################################
##
## Create mount points to run chroot environment
##
###################################################################

. ./config.sh

mount -t proc /proc $DIR/proc
mount --make-rslave $DIR/proc

mount --rbind /sys $DIR/sys 
mount --make-rslave $DIR/sys

mount --rbind /dev $DIR/dev
mount --make-rslave $DIR/dev