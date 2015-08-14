===================
Usando Meikian Live
===================

La descarga de la distribución *Meikian Live* puede hacerse a través de los enlaces que figuran en el apartado de descargas de la página `www.meikian.eu`_.

Una vez descargado el archivo ``iso`` conteniendo la distribución, se necesita transferir su contenido a un medio físico. Los procedimientos para realizar dicha operación dependerán tanto del medio físico, como del sistema operativo utilizados.

Grabación a DVD
---------------

No plantea ningún problema en cuanto a la plataforma o el sistema operativo utilizados, puesto que cualquier programa de grabación a ``CD``/``DVD`` que permita la grabación de imágenes ``iso`` servirá para realizar esta operación.


Copia a un dispositivo de almacenamiento USB
--------------------------------------------

Utilizando GNU/Linux
~~~~~~~~~~~~~~~~~~~~

El primer paso será conectar la unidad de almacenamiento que quiere emplearse para la copia de la distribución, debiendo tener ésta el tamaño suficiente como para poder albergar el archivo ``iso`` descargado. En caso de querer crear una o más particiones adicionales para utilizar persistencia de los datos, el tamaño necesario habrá de aumentarse en función del tamaño que se quiera para dichas particiones.

Una vez conectada la unidad de almacenamiento, desde una consola de comandos puede utilizarse el comando ``dmesg`` para ver las últimas líneas de mensajes del ``kernel`` y obtener así el identificador de dispositivo que el sistema le ha asignado. 

Para realizar la copia del archivo ``iso`` pueden emplearse dos métodos diferentes:

* El primero, más correcto, será utilizando los comandos ``isoinfo`` y ``dd``:

  Por ejemplo, para obtener la información del archivo ``meikian-live_beta1.iso`` se ejecutará el siguiente comando::

    user@meikian-dev:~$ isoinfo -d -i meikian-live_beta1.iso
         
    CD-ROM is in ISO 9660 format
    System id: 
    Volume id: Meikian_20140915
    Volume set id: 
    Publisher id: MEIKIAN
    Data preparer id: LIVE-BUILD 3.0.5-1; HTTP://PACKAGES.QA.DEBIAN.ORG/LIVE-BUILD
    Application id: MEIKIAN LIVECD
    Copyright File id: 
    Abstract File id: 
    Bibliographic File id: 
    Volume set size is: 1
    Volume set sequence number is: 1
    Logical block size is: 2048
    Volume size is: 749984
    El Torito VD version 1 found, boot catalog is in sector 76
    Joliet with UCS level 3 found
    Rock Ridge signatures version 1 found
    Eltorito validation header:
      Hid 1
      Arch 0 (x86)
      ID ''
      Key 55 AA
      Eltorito defaultboot header:
        Bootid 88 (bootable)
        Boot media 0 (No Emulation Boot)
        Load segment 0
        Sys type 0
        Nsect 4
        Bootoff 19B32 105266


  De la información que devuelve el comando se necesitan los valores de los campos ``Logical block size`` y ``Volume size``.

    .. warning::
      El siguiente proceso elimina la tabla de particiones y toda la información contenida en el dispositivo que se indique, por eso es imprescindible asegurarse de que se trata del dispositivo correcto


  El comando que debe ejecutarse es::

    dd if="ruta al archivo descargado" bs="Logical block size" count="Volume size" of=/dev/"dispositivo de sistema del destino"

    
  Usando los datos del ejemplo anterior para un pendrive al que se le ha asignado un identificador de dispositivo ``sdb``, se ejecutará el siguiente comando con permisos de superusuario, ya sea mediante el uso del comando ``su`` o de ``sudo``::

    user@meikian-dev:~$ sudo dd if=meikian-live_beta1.iso bs=2048 count=749984 of=/dev/sdb


* El segundo, más rápido y que normalmente suele ser suficiente, usando únicamente el comando ``dd``: 

    .. warning::
      El siguiente proceso elimina la tabla de particiones y toda la información contenida en el dispositivo que se indique, por eso es imprescindible asegurarse de que se trata del dispositivo correcto


  El comando que debe ejecutarse es::

    dd if="ruta al archivo descargado" of=/dev/"dispositivo de sistema del destino"


  Usando los datos del ejemplo anterior para un pendrive al que se le ha asignado un identificador de dispositivo ``sdb``, se ejecutará el siguiente comando con permisos de superusuario, ya sea mediante el uso del comando ``su`` o de ``sudo``::

    user@meikian-dev:~$ sudo dd if=meikian-live_beta1.iso of=/dev/sdb

    
Una vez el comando devuelve el control a la consola, y si no se ha producido ningún error durante el proceso, la copia ya estará realizada. Para arrancar la distribución es necesario asegurarse de que el equipo permita el arranque desde dispositivos ``USB`` y que en la ``BIOS`` del equipo esté seleccionado correctamente el orden de la secuencia de arranque.


Utilizando MAC OSX
~~~~~~~~~~~~~~~~~~

En equipos con MAC OSX es posible emplear el mismo método que para GNU/Linux, variando únicamente el nombre del dispositivo en el que se va a volcar el contenido de la imagen.

Para facilitar la utilización del comando ``dd`` puede emplearse la utilidad `dd-gui`_ , que permite utilizar un interfaz gráfico para realizar las operaciones.


Utilizando MS Windows
~~~~~~~~~~~~~~~~~~~~~

En equipos con MS Windows es posible utilizar una utilidad como `win32diskimager`_ para realizar la operación, que es similar al comando ``dd`` de GNU/Linux pero usando un interfaz gráfico.


Uso de persistencia para los datos del usuario
----------------------------------------------

Para conservar la información, archivos, configuraciones, etc. o los cambios que se realicen entre reinicios de la distribución *Live*, puede recurrirse al uso de particiones auxiliares en las que la información quede almacenada de manera permanente. Para ello Puede elegirse entre dos tipos diferentes de persistencia de la información:

* **De datos de sistema** en la que se almacenan todos los cambios que se realicen en el sistema, incluidos los de el directorio del usuario.
* **De datos de usuario** en la que se almacenan únicamente los cambios que se realicen en el directorio del usuario.

No son excluyentes, por lo que pueden crearse ambas o cualquiera de las dos por separado.

Para que se active la persistencia de datos es necesario crear una o ambas particiones adicionales en el espacio libre del dispositivo ``USB`` o en el disco duro y usar para éllas un sistema de ficheros de tipo ``ext3`` o ``ext4`` con las siguientes etiquetas de volumen:

* ``live-rw`` para tener persistencia de datos de sistema.
* ``home-rw`` para tener persistencia de datos de usuario.

Si se crean desde la propia distribución *Live*, será necesario reiniciar el sistema para que las nuevas particiones se reconozcan en el arranque y se genere la estructura de directorios y archivos necesaria para su funcionamiento.


Usuarios
--------

Los usuarios definidos por defecto en la distribución son los siguientes:

* ``root`` es el usuario administrador y se encuentra deshabilitado por defecto, por lo que para ejecutar acciones o comandos con privilegios de superusuario habrá que recurrir al uso de los comandos ``su``, ``sudo`` o ``gksudo``.
* ``user`` es el usuario de uso habitual con la distribución y su contraseña es ``live``.

  .. note::
    Cuando la distribución esté instalada en disco duro sera necesario introducir la contraseña del usuario para la ejecución de ciertos comandos o acciones que necesitan privilegios de superusuario, no siendo así en el modo *Live*.


.. _`dd-gui`: http://www.gingerbeardman.com/dd-gui
.. _`www.meikian.eu`: http://www.meikian.eu
.. _`win32diskimager`: http://sourceforge.net/projects/win32diskimager

