#!/bin/bash

###
### Debian-Live v4.x-Meikian
### 2015/01/05

if [ $# = 0 ]; then
    echo -e "\nError: please add the image type to build (iso|iso-hybrid|usb-hdd|tar)\n"
    exit 0
fi 


## default values
HOME_DIR="/home/debian-live/"
BUILD_DIR="${HOME_DIR}/meikian-live"

file_date=`date +"%Y%m%d"`
file_name="meikian-live_${file_date}"
msgs_date=`date +"%Y/%m/%d"`


## raise the hard-limit and soft-limit values for the permitted maximum number of opened files
#ulimit -Hn 32768
ulimit -Sn 32768

## clean the working directory
lb clean --all

## update the current date in the isolinux menu
if [ -e "${BUILD_DIR}/config/bootloaders/isolinux/stdmenu.cfg.in" ]; then
    sed "s#<DATE>#${msgs_date}#" "${BUILD_DIR}/config/bootloaders/isolinux/stdmenu.cfg.in" \
      > "${BUILD_DIR}/config/bootloaders/isolinux/stdmenu.cfg"
fi

## create a compressed file with all the files needed to build the distro
if [ ! -e "${HOME_DIR}/${file_name}.tgz" ]; then
    rm -f "${HOME_DIR}/${file_name}.tgz"
    tar cvfzp "${HOME_DIR}/${file_name}.tgz" "${BUILD_DIR}"    \
        --exclude "${BUILD_DIR}/cache"
    # uncomment the following line to include the compressed file within the .iso file
    #mv -f "${HOME_DIR}/${file_name}.tgz" "${BUILD_DIR}/config/includes.binary"
fi

## setup the "live" system
lb config noauto                                                      \
    --distribution jessie --system live                               \
    --architectures i386                                              \
    --linux-flavours "3.16.0-4-586 3.16.0-4-686-pae"                  \
    --apt apt --apt-indices false --apt-recommends false              \
    --apt-secure true --security true --apt-source-archives true      \
    --backports true --updates true                                   \
    --mirror-bootstrap "http://http.debian.net/debian/"               \
    --mirror-chroot "http://http.debian.net/debian/"                  \
    --mirror-chroot-security "http://security.debian.org"             \
    --mirror-binary "http://http.debian.net/debian/"                  \
    --mirror-binary-security "http://security.debian.org"             \
    --archive-areas "main contrib non-free"                           \
    --binary-images ${1}                                              \
    --firmware-binary true                                            \
    --firmware-chroot true                                            \
    --iso-volume "Meikian_${file_date}"                               \
    --iso-application "Meikian Live"                                  \
    --iso-publisher "Meikian"                                         \
    --bootappend-live "boot=live components hostname=meikian username=user noeject" \
    --memtest none                                                    \
    --win32-loader true                                               \
    --debian-installer live

## start the building process
lb build 

