============
Meikian Live
============

*Meikian Live* originally born as *CW-Live* within the `Clone Wars Project`_ community.

The idea behind *Meikian Live* origin is to provide a working environment with the most common tools to work with 3D printers (part design and printing), `Arduino`_, electronic circuits, CNC, RC, robotics, etc., as well as resources and related documentation. 

.. _`Arduino`: http://www.arduino.cc
.. _`Clone Wars Project`: http://www.reprap.org/wiki/Proyecto_Clone_Wars

The main points to be considered in their development are: 

* Make it a **free system**. It must allow free usage, modification and redistribution to anyone interested in using it. 

* A **low resources consumption**. It is important that the needed resources for operation are low, as this will allow to use it in a greater number of computers while allowing reuse of older machines.


What is a "Live" distribution?
------------------------------

A *Live* distribution is a set consisting of an operating system, additional software and settings, that is ready to boot and run from a removable drive (``CD``/``DVD-ROM``, ``USB`` flash or hard drive, etc.), allowing you to work with it without affecting the operating system, software or settings of the computer on which it runs.


Technological base
------------------

`Debian`_ GNU/Linux was used for the development of the distribution as base operating system. It is one of the oldest GNU/Linux that exist today and enjoying excellent health, as evidenced by the fact that it is still used as a base for many other distributions, some of them really popular, as `Ubuntu`_ or `LinuxMint`_.

The software used for its development is `DebianLive`_, a `Debian`_ own system to create custom *Live* systems.

.. _`Debian`: http://www.debian.org
.. _`DebianLive`: http://live.debian.net
.. _`LinuxMint`: http://www.linuxmint.com
.. _`Ubuntu`: http://www.ubuntu.com


Resources
---------

* The `Meikian`_ web page.

* The code and files needed to generate an image of the distribution from scratch are available in `meikian-dev`_ `GitHub`_ repository.

* The complete project documentation is included in the distribution itself and also available *online* at `docs.meikian.eu`_.

* A mailing list / user's group at `Google Groups`_.


.. _`Meikian`: http://meikian.eu
.. _`GitHub`: https://github.com
.. _`meikian-dev`: https://github.com/ctemescw/meikian-dev
.. _`docs.meikian.eu`: http://docs.meikian.eu/en/stable
.. _`Google Groups`: http://groups.google.com/group/meikian
.. _`RepRap.org`: http://reprap.org


Hardware requirements
---------------------

The requirements to run *Meikian Live* are relatively modest compared with the hardware resources at the disposal of any existing equipment. In turn, the total resources consumption is also determined by the tasks that will be performed, so it is not recommended to use the distribution with lower resources than the specified ones to be able to work with minimal fluency in most included programs:

* **Memory**: Minimum amount of ``RAM`` memory recommended is 512MB

  .. note::
    If **unpartitioned** free space is available on the hard drive of the computer or the device from which you are booting, overall performance may be improved by creating partitions for ``swap`` or for ``data persistence``. In this way part of the used RAM is released and is then available to be used by the operating system and the programs.

* **Processor**: Intel Pentium4 or equivalent minimum processor.


Hardware tested with the distribution
-------------------------------------

Computers
~~~~~~~~~

* Acer Aspire 7220: OK
* Acer Aspire 5610Z: OK
* Acer Aspire 7750G: OK
* Apple MacBook 2007 A1181: Boot from USB devices is not working, booting from DVD unit OK
* Apple MacBook Air 11" 2011: OK
* Apple MacBook Pro 5.1 15" late 2008: Not detected booting. KO
* Apple MacBook Pro Retina 11.2 15" late 2013: Boot with some problems and does not detect the WiFi card
* Apple MacMini 2012: Boot with some problems and does not detect the WiFi card
* Asus A55VD: OK
* Asus EeePC T101MT: OK
* Asus X54H: ---
* Clevo D400E: OK
* Dell Inspiron 1564-4730: The WiFi card is a Broadcom Corporation BCM4312 802.11b/g LP-PHY using the b43 module (firmware needed). OK
* Dell Inspiron n5050: OK
* Dell Latitude D610: WiFi interface is "eth*" not "wlan*". OK
* Dell Latitude E6400: OK
* Dell XPS L521X: OK
* HP 500B MT: OK
* HP Compaq NX9030: WiFi interface is "eth*" not "wlan*". OK
* Lenovo Ideapad u430 Touch: Without WiFi support. OK
* Lenovo n500: OK
* Lenovo t430s: OK
* Lenovo x200s: OK
* PackardBell EasyNote A7738: WiFi interface is "eth*" not "wlan*". OK
* PackardBell S1300: Tested booting from DVD unit. OK
* Toshiba PORTEGE Z930-145: OK
* Toshiba Satellite A300: OK


Controller boards
~~~~~~~~~~~~~~~~~

* `Arduino Mega 2560`_ + `RAMPS 1.4`_
* `Gen7 1.4.1`_
* `Gen7 1.5`_
* `Megatronics v2.0`_
* Megatronics v3.0
* `Sanguinololu 1.3a`_
* `SAV MKI`_ + `SAV 3D LCD`_

.. _`Arduino Mega 2560`: http://arduino.cc/en/Main/arduinoBoardMega2560
.. _`Gen7 1.4.1`: http://reprap.org/wiki/Gen7_Board_1.4.1
.. _`Gen7 1.5`: http://reprap.org/wiki/Gen7_Board-AVR_1.5
.. _`Megatronics v2.0`: http://reprap.org/wiki/Megatronics_2.0
.. _`RAMPS 1.4`: http://reprap.org/wiki/RAMPS_1.4
.. _`Sanguinololu 1.3a`: http://reprap.org/wiki/Sanguinololu
.. _`SAV 3D LCD`: http://reprap.org/wiki/SAV_3D_LCD
.. _`SAV MKI`: http://reprap.org/wiki/SAV_MKI

