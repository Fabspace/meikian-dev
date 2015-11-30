=======================================
Construyendo una imagen de Meikian live
=======================================

*Meikian Live* es desarrollada con `Debian`_ GNU/Linux 8.x ``Jessie`` para arquitectura ``x86`` utilizando para ello `DebianLive`_, el sistema de creación de sistemas ``live`` propio de dicha distribución. Es posible utilizar otras versiones o arquitecturas, o incluso usar distribuciones derivadas, pero en dichos casos ya no se puede garantizar que funcione el proceso detallado a continuación o que sea el mismo.

Para generar una imagen de *Meikian Live* partiendo de cero se necesitan previamente una serie de requisitos.


Acceso de superusuario
----------------------

El ``script`` de creación necesita ejecutarse con permisos de susperusuario, ya sea mediante el uso del comando ``su`` o de ``sudo``.


Utilidades necesarias
---------------------

Se necesitan una serie de utilidades instaladas previamente, para lo que puede recurrirse al siguiente comando::

  user@meikian-dev:~$ sudo apt-get install apt-utils debootstrap dosfstools debian-keyring fakeroot genisoimage genext2fs gnu-fdisk loadlin mtd-utils parted squashfs-tools syslinux uuid-runtime win32-loader xorriso

También es necesario que esté instalado el conjunto de utilidades de `DebianLive`_ en su rama ``4.x`` que es la que se encuentra actualmente disponible en `Debian`_ GNU/Linux 8.x ``Jessie``. Para ello también puede utilizarse el comando::

  user@meikian-dev:~$ sudo apt-get install live-build


Repositorio de Meikian Live en GitHub
-------------------------------------

Se necesita disponer de una copia del contenido del repositorio de *Meikian Live* en `GitHub`_. Esto puede hacerse de dos maneras diferentes, clonando el repositorio o descargándose el archivo ``zip`` con su contenido desde la propia página de `GitHub`_.

 * Para clonar el repositorio se necesita tener instalado ``git``. En caso de que no esté disponible en el sistema, puede instalarse con el siguiente comando::

    user@meikian-dev:~$ sudo apt-get install git

  A continuación necesita crearse un directorio para almacenarlo y proceder a clonar el contenido del repositorio en él, para lo que pueden utilizarse los siguientes comandos::

    user@meikian-dev:~$ mkdir my_meikian
    user@meikian-dev:~$ git clone https://github.com/ctemescw/meikian-dev.git my_meikian

 * Si en cambio se descarga el archivo comprimido con el contenido del repositorio, es necesario tener instalado un descompresor para archivos en formato ``zip`` como puede ser ``unzip``. En caso de no estar disponible en el sistema, puede instalarse ejecutando el siguiente comando::

    user@meikian-dev:~$ sudo apt-get install unzip

  A continuación se descomprime el archivo ``zip`` descargado previamente y se renombra para trabajar más fácilmente con él::

    user@meikian-dev:~$ unzip develop.zip
    user@meikian-dev:~$ mv meikian-dev-development my_meikian


Modificación del script de creación de Meikian Live
---------------------------------------------------

Es necesario modificar un par de parámetros dentro del ``script`` de creación de la distribución para especificar la ruta en la que se ha copiado el contenido del repositorio de *Meikian Live*.

Dentro del directorio utilizado para albergar el contenido del repositorio se encuentra el ``script`` ``make-live.sh``, en el cual se modificarán las líneas ``14`` y ``15`` para especificar las rutas correspondientes.

El contenido original de dichas líneas es::

    ## default values
    HOME_DIR="/home/debian-live/"
    BUILD_DIR="${HOME_DIR}/meikian-live"

* ``HOME_DIR`` representa la ruta al directorio padre del directorio con los contenidos del repositorio
* ``BUILD_DIR`` representa la ruta completa al directorio con los contenidos del repositorio

Como ejemplo para el caso de un usuario ``user`` que tiene su directorio de usuario en ``/home/user`` y que crea dentro de él un directorio ``my_meikian`` para los datos del repositorio de *Meikian Live*, los valores por los que han de sustituirse los originales son::

    ## default values
    HOME_DIR="/home/user/"
    BUILD_DIR="${HOME_DIR}/my_meikian"


Aplicar parche a Live-Build 4.x
-------------------------------

Dentro del repositorio de *Meikian Live* en `GitHub`_ existe un directorio ``patches`` y dentro de él un parche necesario para la rama 4.x de ``Live-Build`` que permite que puedan crearse imágenes con más de dos ``kernels`` diferentes.

Si se utiliza el mismo caso de ejemplo que en apartados anteriores, los comandos a ejecutar para aplicar el parche son los siguientes::

    user@meikian-dev:~$ cd my_meikian/patches 
    user@meikian-dev:~/my_meikian$ sudo patch -p0 < live_build-4.x_binary_syslinux.patch


Creación de la iso de Meikian Live
----------------------------------

El ``script`` de creación de la distribución permite generar varios tipos de imágenes con finalidades diferentes. Los tipos disponibles son:

 * ``iso`` imagen en formato ISO9660 estándar destinada a la grabación en ``DVD``
 * ``iso-hybrid`` imagen ``iso`` híbrida que permite la grabación a ``DVD`` o la copia a una memoria ``USB``
 * ``usb-hdd`` imagen para la copia a un disco duro ``USB``
 * ``tar`` genera un archivo que contiene todo el sistema de ficheros de la distribución

Una vez se han cumplido todos los requisitos especificados en los apartados anteriores, puede procederse a crear una imagen de *Meikian Live*.

  .. note::
    Factores que deben tenerse en cuenta:

     * El proceso puede durar entre una y varias horas dependiendo de los recursos del equipo en el que se realice
     * Es necesario disponer de al menos 15GB de espacio libre en el disco duro
     * Es necesario que el equipo disponga de conexión a ``Internet`` durante el proceso

El comando para la creación de la imagen de la distribución es::

    make-live.sh <"tipo de imagen a crear"> 

Si se utiliza el mismo caso de ejemplo que en apartados anteriores, los comandos necesarios para generar una imagen de tipo híbrido de la distribución son los siguientes::

    user@meikian-dev:~$ cd my_meikian
    user@meikian-dev:~/my_meikian$ sudo ./make-live.sh iso-hybrid



.. _`Debian`: http://www.debian.org
.. _`DebianLive`: http://live.debian.net
.. _`GitHub`: https://www.github.com

