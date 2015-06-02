#!/bin/sh

# applying customization changes at boot
#

echo "I: applying customization changes"

## get the parameters selected at the boot menu
export `cat /proc/cmdline | \
   sed -e 's/live-config//' | sed -e 's/keyboard-layouts/keyb/'`


DEFAULT_EXT="en"
FILE_LANG=`echo $locales | cut -d '_' -f1`
DEFAULT_USER="user"
STATUS_FILE=".meikian_configured"
CURRENT_DIR=`pwd`


## check if a status file exists
[ -f "/home/${DEFAULT_USER}/${STATUS_FILE}" ] && exit 0


## applying changes
su -l ${DEFAULT_USER} -c 'xdg-user-dirs-update; xdg-user-dirs-gtk-update'

if [ "${FILE_LANG}" = "es" ]; then
    FILE_EXT="${FILE_LANG}"
    DESKTOP_DIR="Escritorio"
    DOWNLD_DIR="Descargas"
else
    FILE_EXT="${DEFAULT_EXT}"
    DESKTOP_DIR="Desktop"
    DOWNLD_DIR="Downloads"
fi

## copy apt sources file to its location
cp -f "/etc/meikian.d/etc/apt/sources.list" "/etc/apt/sources.list"

## setup Chromium bookmarks
cp -f "/etc/meikian.d/etc/skel/.config/chromium/Default/Bookmarks.${FILE_EXT}" \
    "/etc/skel/.config/chromium/Default/Bookmarks"
cp -f "/etc/meikian.d/etc/skel/.config/chromium/Default/Bookmarks.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.config/chromium/Default/Bookmarks"

## copy Firefox bookmarks and configuration
cp -f "/etc/meikian.d/etc/iceweasel/profile/bookmarks.html.${FILE_EXT}" \
    "/etc/iceweasel/profile/bookmarks.html"
cp -f "/etc/meikian.d/etc/iceweasel/profile/prefs.js.${FILE_EXT}" \
    "/etc/iceweasel/profile/prefs.js"

## copy Xchat configuration
cp -f "/etc/meikian.d/etc/skel/.xchat2/xchat.conf.${FILE_EXT}" \
    "/etc/skel/.xchat2/xchat.conf"
cp -f "/etc/meikian.d/etc/skel/.xchat2/xchat.conf.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.xchat2/xchat.conf"

## copy launchers and folders to the user's desktop
mkdir -p "/etc/skel/${DESKTOP_DIR}"
mkdir -p "/home/${DEFAULT_USER}/${DESKTOP_DIR}"

for file in "/etc/meikian.d/desktop/${FILE_EXT}/*"; do
    cp -f ${file} "/etc/skel/${DESKTOP_DIR}/"
    cp -f ${file} "/home/${DEFAULT_USER}/${DESKTOP_DIR}"
done

cd "/etc/skel/${DESKTOP_DIR}"; ln -s "../${DOWNLD_DIR}" "${DOWNLD_DIR}"; cd "${CURRENT_DIR}"
cd "/home/${DEFAULT_USER}/${DESKTOP_DIR}"; ln -s "../${DOWNLD_DIR}" "${DOWNLD_DIR}"; cd "${CURRENT_DIR}"

chown -R ${DEFAULT_USER}:${DEFAULT_USER} "/home/${DEFAULT_USER}"


## set a status file
touch "/home/${DEFAULT_USER}/${STATUS_FILE}"

