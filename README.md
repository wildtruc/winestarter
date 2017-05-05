# winestarter
A not very simple script to start wine emulated applications

![winestarter logo](/png/defaults/winestarter_128.png)

# IMPORTANT MESSAGE (05/05/17) :
A huge mistake has been discovered in the Makefile preventing user directories and files to be installed correctly.

This is fixed. ALL MY APOLOGIES.
 
-------
# Basics
The project comes with 2 scripts:
 - `winestarter`: the command line base.
 - `winestarter_conf`: the Yad graphical interface

Config file and configuration UI are completly independent and script can work without the UI.

Note that all OpenGL environment variables are dedicated to Nvidia Graphic cards.

## History
For everyboby using Wine know that launching a Wine emulated application could by real nightmare.

When you surf over **WineHQ**, there is often many tricks, "env" variables, register edits not very fun for both newbies or old Wine user guys.

So, newbies goes to PlayOnllinux to feel more confortable with less options and old guy never stop to write mini bash launcher script or commandlines that easely cross over the Channel.
Well, boring...


At the beginning, I wish to get a script to launch some games over **Wine** and **Bumblebee**. If **Wine** command lines could be a bit long, I wont tell you with **Bumblebee** !

I turn around the right solution since a while, but finally got this one and I'm very happy with it.


Note to MAC users: The script will probably works for you (don't know for Yad), but it need somme desktop environnent I don't have or know. So, if you want it, give a hand !

# OS Depencies
 - Yad (zenity fork, usualy by default in distros, for Debian see **[here](https://packages.debian.org/sid/amd64/yad/download)**)
 - wget (for PoL packages download, usualy by default in all distros)
 - ImageMagick (for image convertion, usualy by default in all distros)
 - strings (for Wine/Ms lnk file reading, usualy by default in all distros)
 - icoutils (for MS Icons png extraction, name can vary by distro)
 - Winetricks (for dlls downlaod and install, usualy in non-free distros repos)
 
 and obviously, Wine :)
 
--------
## Features
 - Create and configure a basic Wine bottle (32 or 64)
 - Configure a custom Wine binaries directory
 - Install Winestricks packages
 - Create and configure a Wine registry
 - Install a MS software.
 - Create or modify a desktop file entry
 - Configure Nvidia apps environment options
 - Configure Xrandr behaviour
 - Set Optimus Bumblebee/Primusrun variables
 
Look to change log at the end of the page.
 
--------
To simplefy usage description, we will use a full working example for config from Final Fantasy XIV game.
 
Script works with normal desktop and Optimus desktop.

The config file is a per game/app file, with all "env" tricks, reg edit you need/want.

I add, between others, a **xrandr** option that can be very useful in some case.

## Install
Download the GIT repo wherever you want :
```sh
	git clone https://github.com/wildtruc/winestart.git
	cd winestart/
	# as sudo or su -c in a terminal
	sudo make install
```

To uninstall:
```sh
	make uninstall
```

To uninstall without remove precious conf files :
```sh
	make safeuninstall
```

The `makefile` will install launcher and configarator in `/usr/local/bin` and the per game/app config file template in `~/.winestarter/configs` user hidden dir.

## Usage
At the very beginning, this was just a app launcher. There's now a tested app install feature and it also can download and install custom Wine binaries and libs from the PlayOnlinux project. Plus, it can convert or modify the desktop file entry (from software installation process or already existing or a complete new one)

Note that winestarter_conf doesn't need any template to start, because it create it from scratch.
The the `winestarter` conf file template is only a model for those wanting to use the script only :

```sh
	winestart game.conf
```
or 
```sh
	winestarter_conf
```
or simply from the menu : Wine > winestarter configurator

## Config file edit
If don't use `winestarter_conf`, you can edit the config file as you wish. It is a per game/app file, so you can create many conf files as you want. I will add a few other example in the repository ( You could contribute by adding yours, if you like)

This is a working example for *Final Fantasy XIV* (march 2017):

```sh
#! /bin/bash

## comments with '##' are unremovable, they are user help comments
## comments with '#' are unset feature

## default is /home/$USER
## default is /home/mike
user_prefix=/home/mike
## game/appli prefix name
bottle_prefix=".wine.FFXIV_64"
## default system path of the game/appli if not in the chosen Wine prefix
game_path="/home/games/FFXIV/SquareEnix"
## Full game dir name in Progrma Files (including Program Files dir name)
game_dir="SquareEnix/FINAL FANTASY XIV - A Realm Reborn"
game_exe="boot/ffxivboot.exe"
## if classic wine command fail, execute .exe inside the directory
special_cmd=0
## set a 64 bits bottle: false (0), true (1)
wine_elf=1

## to lauch winecfg at first launch
w_config=0
## Do not remove or edit below except if you don't use winestarter configurator.
_wine=1

## first install launch and prefix creation (0) already set, (1) first launch
w_install_tricks=0
## Winetricks components list
w_tricks_list="d3dx9,d3dx11_42,d3dx11_43,physx,xact_jun2010"
## config set from winestarter configurator
_tricks=1

## This option allow to install .exe or .msi directly (experimental) 
w_install_exe=0
## Winetricks options, if any
w_tricks_opts='--no-isolate'
## Full path of the exe/msi file
w_exe_path="/home/mike/.cache/winetricks/steam/SteamInstall_French.msi"
## config set from winestarter configurator
_install=1

## extra wine registry specific entry
## leave user_reg blank if none : user_reg=''
## possible values are:
## "StrictDrawOrdering"="disabled"'
## "DirectDrawRenderer"="opengl"
## "Nonpower2Mode"="repack"
## "OffscreenRenderingMode"="fbo"
## "RenderTargetLockMode"="auto"
## "UseGLSL"="readtex"
## "VideoMemorySize"="(memory size of your graphic card)"
user_reg='[HKEY_CURRENT_USER\Software\Wine\Direct3D]
"StrictDrawOrdering"="disabled"
"VideoMemorySize"="6072"'
## config set from winestarter configurator
_reged=1

## optimus starter with options
## comment if you don't need them
use_optimus=0
## set the optimus starter : 'optirun', 'primusrun'
opti_starter="optirun"
## optirun need '-b' option if choosing between 'VirtualGl' or 'primus' virtualizer
## if using 'primusrun' leave 'opts' and 'accel' blank ('')
opti_opts='-b'
## set optirun vitualizer: 'virtualgl', 'primus'
opti_accel="primus"
## optimus env options
opti_SYNC=1
## Optimus Vertical sync behavior, prefered is usualy off (0)
## set enable (1) or disable (0)
opti_VBLK=0
## config set from winestarter configurator
_optimus=0

## optional xrandr command set, useful when you have strange fullscreen beshavior
## set enable (1) or disable (0)
auto_set=0
## fullscreen mode for your app
set_xrandr='xrandr --output HDMI-1 --mode 1280x720 --rate 60'
## your default screen mode
bck_xrandr='xrandr --output HDMI-1 --mode 1920x1080 --rate 60'

## optional desktop environment replacement:
## This option allow you to replace a buggy enduser graphical environment
## by a lighter one (OpenGl glitch, etc). This suppose a second desktop UI is
## already installed. 
## set enable (1) or disable (0)
set_desktop_env=0
## selec the default UI and replacement UI
default_desktop='cinnamon'
secondary_desktop='/usr/bin/openbox'
## reverse mouse button  
mouse_set=0
mouse_dev='Minicute Mouse'
mouse_btn='xinput set-button-map 10 1 2 3'
## config set from winestarter configurator
_xrandr=0

## FSAA: Full Scene Anti Aliasing: can be set from 1 to 5:
## off [0], 2x (2xMS) [1], 4x (4xMS) [5], 8x (4xSS, 2xMS) [9], 8x (8xMS) [10], 16x (4xSS, 4xMS) [11]
export __GL_FSAA_MODE=5
## if set, FSAA comes 2 others variables that have to be set as follow respectively :
## To get FSAA full control: [0] [0]
## To get FSAA if application use multisample : [0] [1]
## To get FSAA controlled by nvidia-setting ignored : [1] [1]
export __GL_FSAAAppControlled=0
export __GL_FSAAAppEnhanced=1
## FXAA, Fast approximate antialiasing: take avantage over traditional multisampling and
## supersampling methods: (0) (1) 
#export __GL_ALLOW_FXAA_USAGE=1
## anisotropic texture filtering set : off (0), x2 (1), x4 (2), x8 (3), x16 (4)
export __GL_LOG_MAX_ANISO=2
## synchronize vertical refresh (0), (1)
export __GL_SYNC_TO_VBLANK=1
## if libpthread is not enabled by default (ex: wine), 
## it can be force to be set with LD_PRELOAD env variable.
#export LD_PRELOAD="libpthread.so.0 libGL.so.1" __GL_THREADED_OPTIMIZATIONS=1
## Perfomance from Nvidia Settings tool can be set to gain graphic performance instead of quality
## Quality (1), Mixed (2), Perfomance (3), otherwise comment it to unset.
export __GL_OpenGLImageSettings=3
## config set from winestarter configurator
_nvidia_1=1

## VBLANK can't bet set for multi screen, set here one of them only (if needed):
#export __GL_SYNC_DISPLAY_DEVICE="CRT-0"
## to set or unset X server FBConfig behaviour : unset [0], set [1]
#export __GL_SORT_FBCONFIGS=1
## updating window moves yield, can be useful when some window app have refresh issues,
## value are : normal yield (''), no yield ["NOTHING"], background ["USLEEP"]
#export __GL_YIELD="USLEEP"
## allow unofficial GLX implmentation. Mostly for debug mode or test, but can be useful
## in some case like Wine : off [0], on [1]
#export __GL_ALLOW_UNOFFICIAL_PROTOCOL=1
## if monitor can manage G-SYNC behaviour, this could improove display performance: off [0], on [1].
## Disable __GL_SYNC_TO_VBLANK to get faster perfrormance and xorg conf options "stereo", "overlays"
export __GL_GSYNC_ALLOWED=1
## ignore GLGS extension check. Could be useful in case of some missing extension in appli GL sets.
# This will permit the shaders to be successfuly recompile: to off [0], on [1]
export __GL_IGNORE_GLSL_EXT_REQS=0
## config set from winestarter configurator
_nvidia_2=1
```

As you can see there is many variable options, in fact you can write as many as you need. It's very useful to test all the tricks send in WinHQ or else where.
You finally keep the ones really needed.

## Xrandr
There is also an **xrandr** option.

For a classic app, this is unuseful, but for games it really could be.


Sometimes is better to set the desktop to the gameplay definition, this way you could get a smoother gameplay, better FPS, etc...

This option use the game *PID* to know when the game start and stop. This way it can reset the screen at your normal display res.

*Final Fantasy XIV* has 3 screen modes: *fullscreen, windowed and borderless window*. This is in the last case the **xrandr** trick is very very useful for small mobile Nvidia GPU.

Hope it would be for you too.

### Xrandr special
Note: `winestarter_conf` UI auto detect this.

To get your default screen res, type in a terminal :
```sh
	xrandr --current | grep -w "connected"
```
it returns something like this :
```
	VGA-0 connected (normal left inverted right x axis y axis)
	LVDS-1 connected (normal left inverted right x axis y axis)
	HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 531mm x 299mm
```

The one with a res is your default(s). You just have now to set it in the conf file to the default reset point.

----------

## Configurator UI
Configurator can do more than the default config file, but doesn't change it except for dedicated configurator needs lines.

There is short user help displayed 

`winestarter_conf` could produce many codes lines in the terminal if the code line ```#bash_opt='-x -c'``` is uncomment. This is intentional for my debug purpose and I can forgot to comment it when pushing on git. Just comment it and uncomment the next.

## Special thanks and Dedicates
To the all community and contributors of **WineHQ** that make the world goes round and made this work possible.

