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


## check if a status file exists
[ -f "/home/${DEFAULT_USER}/${STATUS_FILE}" ] && exit 0


## applying changes
su -l ${DEFAULT_USER} -c 'xdg-user-dirs-update; xdg-user-dirs-gtk-update'

if [ "${FILE_LANG}" = "es" ]; then
    FILE_EXT="${FILE_LANG}"
    DESKTOP_DIR="Escritorio"
else
    FILE_EXT="${DEFAULT_EXT}"
    DESKTOP_DIR="Desktop"
fi

# copy customized .gtk-bookmarks to the user's home
cp -f "/etc/meikian.d/etc/skel/.gtk-bookmarks.${FILE_EXT}" "/home/${DEFAULT_USER}/.gtk-bookmarks"

# copy Arduino configuration to the user's home
cp -rf "/etc/meikian.d/etc/skel/.arduino15" "/home/${DEFAULT_USER}/"

# copy Chromium bookmarks and configuration to the user's home
cp -f "/etc/meikian.d/etc/skel/.config/chromium/Default/Bookmarks.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.config/chromium/Default/Bookmarks"
cp -f "/etc/meikian.d/etc/skel/.config/chromium/Default/Preferences.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.config/chromium/Default/Preferences"

# copy Firefox bookmarks and configuration to the user's home
cp -f "/etc/meikian.d/etc/skel/.mozilla/firefox/acrs5bg5.default/localstore.rdf.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.mozilla/firefox/acrs5bg5.default/localstore.rdf"
cp -f "/etc/meikian.d/etc/skel/.mozilla/firefox/acrs5bg5.default/places.sqlite.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.mozilla/firefox/acrs5bg5.default/places.sqlite"
cp -f "/etc/meikian.d/etc/skel/.mozilla/firefox/acrs5bg5.default/prefs.js.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.mozilla/firefox/acrs5bg5.default/prefs.js"

# copy Processing configuration to the user's home
cp -rf "/etc/meikian.d/etc/skel/.processing" "/home/${DEFAULT_USER}/"

# copy Xchat configuration to the user's home
cp -f "/etc/meikian.d/etc/skel/.xchat2/xchat.conf.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.xchat2/xchat.conf"

# copy configurations directory to the user's home
if [ "${FILE_EXT}" = "es" ]; then
    cp -rf "/etc/meikian.d/etc/skel/Configurations" \
        "/home/${DEFAULT_USER}/Configuraciones"
else
    cp -rf "/etc/meikian.d/etc/skel/Configurations" \
        "/home/${DEFAULT_USER}/Configurations"
fi

# copy icons and folders to the user's desktop
for file in "/etc/meikian.d/desktop/${FILE_EXT}/*"; do
    cp -f ${file} "/home/${DEFAULT_USER}/${DESKTOP_DIR}"
done


chown -R ${DEFAULT_USER}:${DEFAULT_USER} "/home/${DEFAULT_USER}"


## set a status file
touch "/home/${DEFAULT_USER}/${STATUS_FILE}"

