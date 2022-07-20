# Intro
This is a script that will build a chroot development environment for the demoscene tool;  https://github.com/cahirwpz/demoscene

I created this because I did not want to spray all the files related to m68-amgiaos-gcc all over my system. This way it it all in one neat place. I have only tested this on Ubuntu Linux 20.04.


# Installing

To install the environment first permit remote x11 clients to connect with;

```xhost +```

Then just run the script with sudo;

```sudo ./install-demoscene.sh```

The script will create a directory in `/demoscene-chroot` that will be used to hold the chroot environment. However this location can be configured in `config.sh`

After the script has complete you can enter the chroot environment with;

```sudo chroot /demoscene-chroot /bin/bash```

Then you should be able to; `cd /demoscene` and do a `make`. This will build all routines. cd into any effects directory and do `make run`, the emulator should start on your desktop and run the routine.

Type `exit` to quit from the chroot prompt.

If you reboot your system you will loss the mount that are setup for the chroot environment. Just run;

```sudo ./mkmounts.sh```

To make development of the effects a little easier, you can set the permissions on files with the source code whilst in the chroot environment

```sudo chmod o+rw -R /demoscene```

This will then alow you to run your IDE from your host system and edit the files.

# Uninstalling

To uninstall just run;

```sudo ./uninstall-demoscene.sh```
