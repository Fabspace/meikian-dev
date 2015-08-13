=============================
Building a Meikian Live image
=============================

*Meikian Live* is developed with `Debian`_ GNU/Linux 8.x ``Jessie`` for ``x86`` architecture, using `DebianLive`_, its own ``live`` systems creator. It is possible to use other versions or architectures, even derived distributions, but in such cases it cannot be guaranteed that the following detailed process works or it may not be the same.

To generate a *Meikian Live* image from scratch, the following requeriment are needed.


Root access
-----------

The creation script needs to be executed with root privileges, either by ``su`` or ``sudo`` command.


Needed tools
------------

A number of preinstalled tools are needed, for which the following command may be used::

  user@meikian-dev:~$ sudo apt-get install apt-utils debootstrap dosfstools debian-keyring fakeroot genisoimage genext2fs gnu-fdisk loadlin mtd-utils parted squashfs-tools syslinux uuid-runtime win32-loader xorriso

It is also needed to have the ``4.x`` branch of `DebianLive`_ toolset installed which is the currently available in `Debian`_ GNU/Linux 8.x ``Wheezy``. For this, may also be used the command below::

  user@meikian-dev:~$ sudo apt-get install live-build


Meikian Live repository on GitHub
---------------------------------

A copy of *Meikian Live* repository content on `GitHub`_ is needed. This can be obtained in two different ways, by cloning the repository or by downloading the ``zip`` file with its content from `GitHub`_ webpage.

 * To clone the repository you need to have ``git`` installed. In case that is not available in the system, it can be installed with the following command::

    user@meikian-dev:~$ sudo apt-get install git

  Next you need to create a directory to store and proceed to clone the repository content in it, for what the follollowing commands can be used::

    user@meikian-dev:~$ mkdir my_meikian
    user@meikian-dev:~$ git clone https://github.com/ctemescw/meikian-dev.git my_meikian

 * If the compressed file is downloaded from the repository instead, ``unzip`` program will be necessary. If it is not available in the system, it can be installed by running the following command::

    user@meikian-dev:~$ sudo apt-get install unzip

  Then the previously downloaded ``zip`` file is decompressed and renamed to more easily work with it::

    user@meikian-dev:~$ unzip develop.zip
    user@meikian-dev:~$ mv meikian-dev-development my_meikian


Modifying Meikian Live building script
--------------------------------------

Few parameters inside the  distribution building ``script`` need to be modified to specify the path where the content of the *Meikian Live* repository has been copied.

Within the directory used to host the content of the repository is located the ``make-live.sh`` ``script``, in which the lines ``14`` and ``15`` need to be edited to specify the corresponding paths.

The original content of these lines is::

    ## default values
    HOME_DIR="/home/debian-live/"
    BUILD_DIR="${HOME_DIR}/meikian-live"

* ``HOME_DIR`` represents the path to the parent directory of the directory with the content of the repository
* ``BUILD_DIR`` represents the full path to the directory with the content of the repository

As an example for the case of a use ``user`` having its home directory in ``/home/user`` and creates inside it a folder ``my_meikian`` for the *Meikian Live* repository data, the values that have to replace the originals are::

    ## default values
    HOME_DIR="/home/user/"
    BUILD_DIR="${HOME_DIR}/my_meikian"


Applying patch to Live-Build 4.x
--------------------------------

Within the *Meikian Live* repository in `GitHub`_ exists a directory named ``patches`` that contains a patch for the ``Live-Build`` 4.x branch needed to build images with more than two boot ``kernels``.

Using the same scenario as in previous sections, the commands to be executed to apply the patch are as follows::

    user@meikian-dev:~$ cd my_meikian/patches 
    user@meikian-dev:~/my_meikian$ sudo patch -p0 < live_build-4.x_binary_syslinux.patch


Creating Meikian Live iso
-------------------------

The distribution building ``script`` can generate various types of images for different purposes. The available types are:

 * ``iso`` image formated with ISO9660 standard intended for recording in ``DVD``
 * ``iso-hybrid`` ``iso`` hybrid image allowing to be recorded in ``DVD`` or to be copied to a ``USB`` flash drive
 * ``usb-hdd`` image to be copied to a ``USB`` hard disk
 * ``tar`` generates a file that contains all the distribution filesystem

Once all the requirements specified in previous sections have been accomplished, you can proceed to create the *Meikian Live* image.

  .. note::
    Factors to be considered:

     * The process can take from one to several hours depending on the resources of the computer that is used
     * At least 15GB of free space on the hard drive are needed
     * It is necessary that the computer has ``Internet`` connection during the process

The command for the distribution image building::

    make-live.sh <"type of image to be created"> 

Using the same scenario as in previous sections, the commands needed to generate a distribution image of the hybrid type are as follows::

    user@meikian-dev:~$ cd my_meikian
    user@meikian-dev:~/my_meikian$ sudo ./make-live.sh iso-hybrid


.. _`Debian`: http://www.debian.org
.. _`DebianLive`: http://live.debian.net
.. _`GitHub`: https://www.github.com

