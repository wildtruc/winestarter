# winestarter
A not very simple, but very cool script to start and install wine emulated applications

![winestarter logo](/png/defaults/winestarter_128.png)

-------

**IMPORTANT MESSAGE** (12/12/2018): I have severe heals issue and I don't really know if I could still manage my project alive. I will try to continue to fix bugs and answer to issues and questions, but I can't tell about the future. It's strongly recommanded to fork to an active dev structure.

**NOTICE**: It important for us to get feedback and bug reports from you. Don't leave us in darkness.

**WARNING v1.02**: This update need a `git pull` before `make update`, only way for new pngs to take place. This is the default method when new content comes out.

-------

Consider this like a Wine graphical extension more than a new Wine environment like PoL or CodeWeavers's CrossOver. The goal for end user is to simplify Wine usual command line with a graphical user interface with the most explantions as possible, and for advanced user, a Wine execution script with extended config file that could be modified as the way he want.

The project use winetricks for DLLs and everything winetricks can do, and take standalone Wine independant packages (optional or standalone) from WineHQ or PlayOnLinux repositories.

Config file and configuration UI are completly independent and script can work without the UI, but UI can do a lot of thing to help you during your journey to install your apps under Wine layer.

Note to MAC users: The basic script will probably works for you with the proper environment variables, but yad wont because developper didn't make a package for Mac. So, if you want it to work for you, give a hand, and help us to add Mac environment variables and invite Yad developper to make a package for you. 

## Changelog and issues
Have a look to [CHANGELOG](./CHANGELOG.md) to follow progress, issues and fixes. You will find also some experience reports about apps install test.

# WARNINGS
I'm still leaning and I often discover issues and bugs. If you can't install, see weird things or everything else, feel free to contact me and we will fix this together.

-------
## Basics
The project comes with 2 scripts:
 - `winestarter`: the command line base.
 - `winestarter_conf`: the Yad graphical interface

Note that all OpenGL environment variables are dedicated to Nvidia Graphic cards and will only appear if a Nvidia Card is detected.

## OS Depencies
 - Yad (zenity fork, usualy by default in distros, for Debian look **[here](https://packages.debian.org/sid/amd64/yad/download)**)
 - zenity (for winetarter script popups, usualy by default in all distros)
 - wget (for PoL and WineHQ packages download, usualy by default in all distros)
 - ImageMagick (for image convertion, usualy by default in all distros)
 - strings (for Wine/Ms lnk file reading, usualy by default in all distros)
 - icoutils (for MS Icons png extraction, name can vary by distro like icotools)
 - Winetricks (send with the git clone and updated)
 - cabextract ( for MS cabinet extraction, usualy by default in all distros)
 - rpm (for rpm2cpio helping extracting rpm package, usualy available in all distros repos)
 - libnotify (for winestarter notification, usualy by default in all distros. Debian: add libnotify-bin )
 
 and obviously, Wine :)
 
--------
## Features
 - Create and configure a basic Wine bottle (32 or 64)
 - Download and configure a custom Wine binaries directory (PoL, WinHQ staging, WineHQ stable)
 - Install Winestricks packages
 - Create and configure a Wine registry
 - Install a software from a file or downloaded.
 - Create or modify a desktop file entry
 - Configure Nvidia apps environment options (if detected)
 - Configure Xrandr behaviour
 - Set Optimus Bumblebee/Primusrun variables
 - and more ...
 
--------
To simplefy usage description, we will use a full working example for config from Final Fantasy XIV game.
 
Script works with normal desktop and Optimus desktop.

The config file is a per game/app file, with all "env" tricks, reg edit you need/want.

I add, between others, a **xrandr** option that can be very useful in some case.

## Install
Download the GIT repo wherever you want. Open a terminal inside the GIT repo and as root user or as sudo (su -c), type:

(Note Debian or RedHat like support su and sudo command; if you like to use sudo in Redhat like, you have to add your current user in adminitrators list)
```sh
	git clone https://github.com/wildtruc/winestart.git
	cd winestart/
	# as sudo or su -c in a user terminal
	sudo make install
```

To update (will update GIT and install):
```sh
	# as sudo or su -c in a user terminal
	sudo make update
```

To uninstall:
```sh
	# as sudo or su -c in a user terminal
	sudo make uninstall
```

To uninstall without remove precious conf files :
```sh
	# as sudo or su -c in a user terminal
	sudo make safeuninstall
```

The `makefile` will install launcher and configarator in `/usr/local/bin` and the per game/app config file template in `~/.winestarter/configs` user's hidden dir.

## Usage

```sh
	winestarter game.conf
```
or 
```sh
	winestarter_conf
```
or simply from the menu : Wine > winestarter configurator

--------
## EXAMPLE

### Config file edit
Note that winestarter_conf doesn't need any template to start, because it create it from scratch.
The `winestarter` conf file template is only a model for those wanting to use the script only


If don't use `winestarter_conf`, you can edit the config file as you wish. It is a per game/app file, so you can create many conf files as you want. I will add a few other example in the repository ( You could contribute by adding yours, if you like)

This is a working example for *Final Fantasy XIV* (march 2017), but keep in mind this is only an example with full parts added for user learning purpose and it will be updated when changes will be made: This one goes with v1.02 update.

```sh
#! /bin/bash

## comments with '##' are unremovable, they are user help comments
## comments with '#' are unset feature

## Allow extended features for winestarter configurator; off (0), on (1)
_extended=0

## default is /home/$USER
user_prefix=$HOME
## game/appli prefix name
bottle_prefix=".wine.FFXIV_64"
## default system path of the game/appli if not in the chosen Wine prefix
game_path="$HOME/games/FFXIV/SquareEnix"
## Full game dir name in Progrma Files (including Program Files dir name)
game_dir="SquareEnix/FINAL FANTASY XIV - A Realm Reborn"
game_exe="boot/ffxivboot.exe"
## By default Winestarter set full screen Wine windowed that improve game stability.
## Set windowed mode: false (0), true (1, default)
windowed=1
## set if the app is portable, it will be install at C: drive root: no (0), yes (1).
app_portable=0
## if classic wine command fail, execute .exe inside the directory
special_cmd=0
## wine can use "start" command to launch apps or installer from absolute path
## useful on old or recalcitrant buggy app.
start_cmd=0
## set a 64 bits bottle: false (0), true (1)
wine_elf=1

## WineDbg speicals:
## In some case WineDbg crash dialog popups even if finally the managed app launch correctly.
## This option prevent the crash dialog to popup on working apps start: on (1), off (0)
dbg_dialog=0
## This option let application handles exceptions by itself, then WneDbg only catches exceptions that
## are not handled by the app and could make debbuging a bit easier: on (1), off (0)
dbg_handle=0
## In some apps, it's possible to send extended options at the end of command line.
## It can be some extra DLLs, game map, etc. Add them here.
wine_opts="-opengl -whatmore and so on" # <- this is an example ->

## to lauch winecfg at first launch
w_config=0
## Do not remove or edit below except if you don't use winestarter configurator.
_wine=1

## (0) first install launch and prefix creation already set, (1) first launch
w_install_tricks=0
## Winetricks components list
w_tricks_list="d3dx9,d3dx11_42,d3dx11_43,physx,xact_jun2010"
## config set from winestarter configurator
_tricks=1

## This option allow to install .exe or .msi through winestarter process.
## It's possible to replace file name path by an internet URL for download it.
w_install_exe=0
## Winetricks options, if any
w_tricks_opts='--no-isolate' # <- this is an example ->
## Full path of the exe/msi file
w_exe_path="/home/mike/.cache/winetricks/steam/SteamInstall_French.msi" # <- this is an example ->
## Additional associated dlls or app packages list to install (if any)
w_more_pkgs=''
## In some cases, install is provided by extractible or auto-extractible package
## This option will install them in the provided directory to the Program Files path
w_install_zip=""
w_install_dir=""
## Download dir is the user default one, you can change it here.
w_download_dir=""
## user script: You can add here a personal or a community script (updater, logs, etc)
## It will be automaticaly pasted in the installed app directory.
## This is very optional and at your own risk
w_extra_script=""
## Do not remove or edit below except if you don't use winestarter configurator.
_install=1

## Use a specific Wine path: yes (1), no (0).
use_winepath=1
## where is your custom Wine binary, if any 
wine_path="$HOME/.winebin"
## custom Wine binary name
wine_ver='2.10-staging'
## Which kind of packages do you want to use:
## PlayOnLinux (0), WineHQ staging (1)
wine_pack=1
## Do not remove or edit below except if you don't use winestarter configurator.
_wbin=1

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
"VideoMemorySize"="4096"
"StrictDrawOrdering"="disabled"
"csmt"=dword:00000001'
## Allow local system apps to launch some file type:
local_association="pdf,docx,doc" # <- this is an example ->
## Register/unsregister DLLs libraies (one arch at a time):
## example: 1,0,foo.dll,poo.dll,
## Where first 1 is register and 0 unregister and secondary 0/1 is wine32/wine64, 2 is both
dll_reg_manager=""
## Do not remove or edit below except if you don't use winestarter configurator.
_reged=1

## optimus starter with options
## comment if you don't need them
use_optimus=0
## set the optimus starter : 'optirun', 'primusrun'
opti_starter="optirun"
## If using 'primusrun' or 'Bumblebee default' leave 'accel' blank ('')
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
## by a lighter one (OpenGl glitch, etc). This suppose a second desktop UI is already installed. 
## set enable (1) or disable (0)
set_desktop_env=0
## selec the default UI and replacement UI
default_desktop='cinnamon'
secondary_desktop='openbox'
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
## if monitor can manage G-SYNC behaviour, this couldimprove display performance: off [0], on [1].
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

### Xrandr
There is also an **xrandr** option.

For a classic app, this is unuseful, but for games it really could be particulary with Optimus laptop.


Sometimes is better to set the desktop to the gameplay definition, this way you could get a smoother gameplay, better FPS, etc...

This option use the game *PID* to know when the game start and stop. This way it can reset the screen at your normal display res.

*Final Fantasy XIV* has 3 screen modes: *fullscreen, windowed and borderless window*. This is in the last case the **xrandr** trick is very very useful for small mobile Nvidia GPU.

Hope it would be for you too.

#### Xrandr special
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
## Special thanks and Dedicates
To the all community and contributors of **WineHQ** that make the world goes round and made this work possible.

