# OpenWrt Exploration

## Goal

Have OpenWrt with OpenSync running on the target device.

## Building OpenWrt

Currently all the following steps have to be run when you make changes to the source code.

    git clone https://git.openwrt.org/openwrt/openwrt.git --branch v18.06.5 --single-branch repo
    docker build -t <whateveryouwant> .
    mkdir bin
    docker run -it --rm --mount type=bind,source="$(pwd)"/bin,target=/home/docker/openwrt/bin <yourbuiltimagename>

Built firmware images will be in the `bin/targets/bcm53xx/generic` directory.

### Build System

[Install](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem)

[Use](https://openwrt.org/docs/guide-developer/build-system/use-buildsystem)

[Beginner's Guide](https://openwrt.org/docs/guide-user/additional-software/beginners-build-guide)

## Target Device

Netgear r6300v2 router

## Flashing New Firmware

If OpenWrt is the current firmware new firmware can be installed through the GUI.

If device is running OEM firmware:

     1. Enable telnet on device
      a. https://oldwiki.archive.openwrt.org/toh/netgear/telnet.console
     2. Get around device firmware restrictions
      a. https://www.myopenrouter.com/comment/40873#comment-40873
     3. Flash OpenWrt firmware using router firmware update GUI

Device will be accesible at `192.168.1.1` in your browser if the web GUI was installed.

You can also ssh into it if there is no GUI.

    ssh root@192.168.1.1

## OpenSync

[Overview](https://static1.squarespace.com/static/5bbce542d7819e023f203f03/t/5d9d22486f82867f0a3ac216/1570579018226/019-2008-01_OpenSync_1.4_Overview.pdf)

[Compiling OpenSync with OpenWrt](https://static1.squarespace.com/static/5bbce542d7819e023f203f03/t/5e00e2261d437559f56c9bd5/1577116200887/019-1223-31_Building_OpenSync_with_OpenWrt.pdf)

## TODOs

1. Building is slow. Make it faster.
2. Build OpenWrt with OpenSync.
3. The docker image build process currently involves copying the source code at build time. Make it possible to get the code at container run time.
4. Tweak .config file to better fit our needs.
5. Try out the [developer hello world](https://openwrt.org/docs/guide-developer/helloworld/start).
6. Find out what the SDK and Image Builder are and determine if they can make things easier.
    1. [Image Builder](https://openwrt.org/docs/guide-user/additional-software/imagebuilder)
    2. [SDK](https://openwrt.org/docs/guide-developer/using_the_sdk)
