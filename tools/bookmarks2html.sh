#!/bin/bash
#----
# Autor / Author: Andres Diz
# Licencia / license: Creative Commons Atribución CompartirIgual (CC BY-SA 4.0)
#
# Este script se distribuye bajo una licencia CC BY-SA version 4.0 cuyo texto 
# se puede leer en http://creativecommons.org/licenses/by-sa/4.0/deed.es_ES
# This script is distributed under CC BY-SA v4.0 license you can read in
# http://creativecommons.org/licenses/by-sa/4.0/
#----
#
show_help () {
	echo "$0 [-h|-?] -i COD -n firefox|chromium|all BOOKMARK-FILE";
	echo 
	echo "Distributed under CC-BY-SA v4.0"
}

error () { 
	echo "$2"
	exit $1
}

OPTIND=1

LENG=err
NAV=all

while getopts "h?i:n:" opt; do
    case "$opt" in
	h|\?)
		show_help
		exit 0
		;;
	i)  LENG=${OPTARG,,}
		;;
	n)  NAV=${OPTARG,,}
		;;
    esac
done

shift $((OPTIND-1))

if [[ $# == 0 ]] ; then 
	show_help
else
	[ $LENG == err ] && error 1 "Código de idioma no proporcionado"
	[ $NAV != firefox -a $NAV != chromium -a $NAV != all ] && error 2 "Navegador no soportado"
	[ $NAV != all ] && NAV=${NAV}'\|all'
	[ $LENG == all ] && LENG='..'
	NAV='^.;.*;'$NAV';.*;.*'
	LENG='^.;.*'$LENG'.*;.*;.*;.*'

	echo '
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL>
	'
	grep $LENG $1 | grep $NAV | awk -F\; '/^+/ { print "<dt><h3>" $4 "</h3><dl>"; } /^-/ { print "</dl>"; } /^ / { print "<dt><a href=\"" $4 "\">" $5 "</a>"; }'
	echo '</DL>'
fi
