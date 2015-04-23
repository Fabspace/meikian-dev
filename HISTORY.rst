.. :changelog:

=======
History
=======

2015.04.25
~~~~~~~~~~

**Version 1.1**

* Updated bookmarks of the Chromium and Iceweasel browsers
* Fixed the configuration of the Chromium and Iceweasel browsers
* Updated FreeCAD to the 0.14.3702 version from the Debian backports repository
* Updated Fritzing to the 0.9.2b version
* Updated Cura to the 15.02 version
* Updated S4A to the 1.6 version
* Removed the S4A firmware from the meikian-misc package and build a standalone package for it
* Removed LibreCAD
* Changed the location for the desktop's background images
* Updated LinuxCNC to the 2.6.5 version
* Added Abiword
* Added Gnumeric
* Added FlatCAM 8.3
* Added Universal Gcode Sender 1.0.7
* Replaced Vinagre remote desktops manager with Remmina
* Added Avrdude


2014.11.07
~~~~~~~~~~

**1st 'stable' version**

* Updated Cura to the 14.09 version
* Firefox browser replaced by Iceweasel
* Updated the meikian-arduino-extras package with new libraries
* Removed Repetier-host due to license issues
* Added FreeCAD Library, Printbot part library and Printbots library for use with FreeCAD
* Added the english translation for the documentation
* Changed the images for boot menu and desktop's background


2014.09.28
~~~~~~~~~~

**1st beta version**

* Packaged Arduino binaries from arduino.cc due to several problems with the Debian testing packages
* Changed the isolinux bootsplash image
* Changed the name of the project to Meikian Live 
* Added a second kernel with PAE and SMP support as the default option in the boot menu
* Added a third kernel with realtime extensions for LinuxCNC
* Added an option for old systems in the boot menu that uses the kernel in the previous versions of the distro
* Migrated the documenting system to RST and readthedocs.org
* Updated Fritzing to the 0.9.0b version
* Updated Slic3r to the 1.1.7 stable version
* Added LinuxCNC 2.6.3
* Added MeshLab 1.3.0
* Added Scratch 1.4
* Added S4A 1.5 
* Added UDEV rules from the OpenOCD project
* Added packages with extra libraries and macros for FreeCAD
* Added a directory to make easier the access to the 3D Printing tools' configuration files
* Added several links to the file manager 
* Replaced oracle-java7-installer with openjdk-7-jre due to license issues
* Removed the memtest86 boot image due to license issues
* Removed the Balder and gPXE boot images
* Removed the Netfabb Basic package due to license issues


2014.07.12
~~~~~~~~~~

**7th alpha version**

* Migrated the system for the creation of the distro to GitHub
* Packaged all the needed software that were not available as a .deb package
* Changed the boot menu to make it multi-language
* Changed the boot scripts to permit language based customizations
* Disabled the Hard Disk installer
* Removed the examples directory
* Updated Printrun to the 2014.01.26 version
* Updated Cura to the 14.7 version
* Updated Netfabb Basic to the 5.1.1 version
* Updated Slic3r to the 11.6 version
* Updated FreeCAD to the 0.14.3692 version
* Added Fritzing 0.8.7b
* Added Graphviz to be able to see the objects's dependencies in FreeCAD
* Backport of PySerial from Debian testing. Included a patch to permit serial connections at any speed
* Added Adobe Flash support to the Chromium browser
* Fixed the installation of the Intel IPW wireless cards' firmware 

2014.03.23
~~~~~~~~~~

**6th alpha version.**

* Added a directory with the firmwares' code "/usr/local/share/firmwares"
* Added a directory with examples and calibration objects "/usr/local/share/examples"
* Added the F.Malpartida's Marlin firmware version that supports the SAV MKI's LCD
* Added the F.Malpartida's New LiquidCrystal v1.2.1 library for use it with the SAV MKI's LCD
* Updated OpenSCAD to the 2014.03 version
* Updated Cura to the 14.03 version
* Added the Inkscape's Gcodetools v1.7 extension

2014.02.19
~~~~~~~~~~

**5th alpha version**

* Added Netfabb Basic 5.1.0
* Updated Slic3r to the 1.0.0RC3 version
* Añadidos the following packages: unetbootin, unetbootin-translations, vinagre, x11vnc
* Added a directory to be able to access from the desktop to the configuration files

2014.02.13
~~~~~~~~~~

**4th alpha version.**

* Added an entry to the boot menu for the Debian-installer
* Updated RepetierHost to the 0.95F version
* Added the following packages: chromium, chromium-l10n, geda-xgsch2pcb, xchat
* Hidden the following packages: htop, mc
* Removed the following packages: dia, firefox, gigolo, thunderbird
* Fixed the support for the Sanguinololu and Rambo controllers in the Arduino's IDE

2014.02.01
~~~~~~~~~~

**3rd alpha version alpha.**

2014.01.14
~~~~~~~~~~

**2nd alpha version.**

2014.01.09
~~~~~~~~~~

**1st alpha version.**

