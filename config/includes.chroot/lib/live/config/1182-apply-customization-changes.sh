#!/bin/sh

# applying customization changes at boot
#

echo "I: applying customization changes"

## get the parameters selected at the boot menu
export `cat /proc/cmdline | \
   sed -e 's/live-config//' | sed -e 's/keyboard-layouts/keyb/'`


DEFAULT_EXT="en"
FILE_LANG=`echo $locales | cut -d '_' -f1`
DEFAULT_USER="cw"

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
cp -f "/etc/cwlive.d/etc/skel/.gtk-bookmarks.${FILE_EXT}" "/home/${DEFAULT_USER}/.gtk-bookmarks"

# copy Chromium bookmarks to the user's home
cp -f "/etc/cwlive.d/etc/skel/.config/chromium/Default/Bookmarks.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.config/chromium/Default/Bookmarks"

# copy Firefox bookmarks to the user's home
cp -f "/etc/cwlive.d/etc/skel/.mozilla/firefox/acrs5bg5.default/places.sqlite.${FILE_EXT}" \
    "/home/${DEFAULT_USER}/.mozilla/firefox/acrs5bg5.default/places.sqlite"

# copy configurations directory to the user's home
if [ "${FILE_EXT}" = "es" ]; then
    cp -rf "/etc/cwlive.d/etc/skel/Configurations" \
        "/home/${DEFAULT_USER}/Configuraciones"
else
    cp -rf "/etc/cwlive.d/etc/skel/Configurations" \
        "/home/${DEFAULT_USER}/Configurations"
fi

# copy icons and folders to the user's desktop
for file in "/etc/cwlive.d/desktop/${FILE_EXT}/*"; do
    cp -f ${file} "/home/${DEFAULT_USER}/${DESKTOP_DIR}"
done

chown -R ${DEFAULT_USER}:${DEFAULT_USER} "/home/${DEFAULT_USER}"
