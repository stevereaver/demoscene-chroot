#!/bin/bash
####################################################################
##
## Build chroot environment for demoscene
##
###################################################################

. ./config.sh

if [ -d $DIR ]; then
  echo "Directory already exists!"
  exit
fi

mkdir $DIR
debootstrap --variant=buildd bullseye $DIR
./mkmount.sh
chroot $DIR apt-get -q update 
chroot $DIR apt-get upgrade -y
chroot $DIR apt install -y universal-ctags cscope git-lfs optipng gcc g++ make golang python3 python3-pip python3-dev socat tmux wget libopenal1 libsdl2-2.0-0 libgl1
chroot $DIR apt autoremove -y
chroot $DIR pip3 install setuptools wheel 
chroot $DIR git lfs install
chroot $DIR git clone https://github.com/cahirwpz/demoscene.git
chroot $DIR pip3 install -r /demoscene/requirements.txt
chroot $DIR wget https://github.com/cahirwpz/demoscene-toolchain/releases/download/2022-04-18/demoscene-toolchain.tar.gz
chroot $DIR tar -C / -xvzf demoscene-toolchain.tar.gz
chroot $DIR rm demoscene-toolchain.tar.gz
chroot $DIR hostname $HOSTNAME
chroot $DIR sed -i -e "1i$HOSTNAME" /etc/hostname
chroot $DIR sed -i -e '$d' /etc/hostname
chroot $DIR sed -i -e '$aexport PATH=$PATH:/usr/local/bin' /root/.bashrc
chroot $DIR sed -i -e '$aexport DISPLAY=:0.0' /root/.bashrc