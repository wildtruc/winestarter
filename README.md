# winestart
A very simple script to start wine emulated applications

-------
## Introduction
For everyboby using Wine know that launching a Wine emulated application could by real nightmare.

When you surf over **WineHQ**, there is often many tricks, "env" variables, register edits not very fun for both newbies or old Wine user guys.

So, newbies goes to PlayOnllinux to feel more confortable with less options and old guy never stop to write mini bash launcher script or commandlines that easely cross over the Channel.
Well, boring...


At the beginning, I wish to get a script to launch some games over **Wine** and **Bumblebee**. If **Wine** command lines could be a bit long, I wont tell you with **Bumblebee** !

I turn around the right solution since a while, but finally got this one and I'm very happy with it.

--------

The GIT repo comes with 2 versions :

The original one used to launch games/apps with *Bumblebee/Optimus*: `optistart`, and a lighter one without the *Optimus* options: `winestart`.

Two files for each :
 - The bash script launcher
 - The config file.

The bash script is static, you can put it anywhere you want.

The config file is a per game/app file, with all "env" tricks, reg edit you need/want.

I add a **xrandr** option that can be very useful in some case.

## Install
Download the GIT repo wherever you want :
```sh
	git clone https://github.com/wildtruc/winestart.git
	# as su -c in a terminal or with sudo
	su-c "make install"
	# or
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

The `makefile` will install launcher in `/usr/local/bin` and the per game/app config file template in `~/.winestart`
If you choose the **optistart** launcher :
```sh
	make -f Makefile.opti install
```

## Usage
First, remenber this is just a launcher.

Edit and rename the winestart/optistart conf file as you wish, then :

```sh
	winestart game.conf
```

## Config file edit
The config is a per game/app file, so you can create many conf files as you want.

This is an example for *Final Fantasy XIV* in the 2 ways (winestart/optistart):

winestart :
```sh
	#! /bin/bash

	## Vertical sync behavior
	## set enable (1) or disable (0)
	VBLK=0
	prefix='.wine.FFXIV_11'
	## note here prefix are in unix tree mode, script autoconvert it
	game_dir="SquareEnix/FINAL FANTASY XIV - A Realm Reborn"
	game_exe="boot/ffxivboot.exe"

	## extra wine registry specific entry
	## comment or leave blank if none ex: user_reg=''
	user_reg='[HKEY_CURRENT_USER\Software\Wine\Direct3D]
	"StrictDrawOrdering"="disabled"'

	## optional xrandr command set, useful when you have strange fullscreen beshavior
	## set enable (1) or disable (0)
	auto_set=1
	## comment all or remove the line to entirely disable
	## this setup use app short name for easely get pid info
	short_name='ffxiv'
	## fullscreen mode for your app
	set_xrandr='xrandr --output HDMI-1 --mode 1280x720 --rate 60'
	## your default screen mode
	bck_xrandr='xrandr --output HDMI-1 --mode 1920x1080 --rate 60'

	## uncomment for debug purpose:
	## recomment if the game is falling to launch
	# export WINEDEBUG=-all
	## FPS debug
	#export WINEDEBUG=fps

	## extra wine options
	#wine_opts='-opengl'

	## extra community tips
	## uncomment, modify as needed
	#export LD_PRELOAD="libpthread.so.0 libGL.so.1"
	#export __GL_THREADED_OPTIMISATIONS=1
```

optistart :
```sh
	#! /bin/bash

	## optimus starter with options
	## comment if you don't need them
	#starter="optirun"
	#opts="-b"
	#accel="primus"
	#starter="primusrun"
	#opts=""
	#accel=""
	## optimus env options
	#SYNC=1
	
	## Vertical sync behavior
	## set enable (1) or disable (0)
	VBLK=0
	prefix='.wine.FFXIV_11'
	game_dir="SquareEnix/FINAL FANTASY XIV - A Realm Reborn"
	game_exe="boot/ffxivboot.exe"

	## extra wine registry specific entry
	## comment or leave blank if none ex: user_reg=''
	user_reg='[HKEY_CURRENT_USER\Software\Wine\Direct3D]
	"StrictDrawOrdering"="disabled"'

	## optional xrandr command set, useful when you have strange fullscreen beshavior
	## set enable (1) or disable (0)
	auto_set=1
	## comment all or remove the line to entirely disable
	## this set use app short name for easely get pid info
	short_name='ffxiv'
	## fullscreen mode for your app
	set_xrandr='xrandr --output HDMI-1 --mode 1280x720 --rate 60'
	## your default screen mode
	bck_xrandr='xrandr --output HDMI-1 --mode 1920x1080 --rate 60'

	## uncomment for debug purpose:
	## recomment if the game is falling to launch
	# export WINEDEBUG=-all
	## FPS debug
	#export WINEDEBUG=fps

	## extra wine options
	#wine_opts='-opengl'

	## extra community tips
	## uncomment, modify as needed
	#export LD_PRELOAD="libpthread.so.0 libGL.so.1"
	#export __GL_THREADED_OPTIMISATIONS=1
```

The difference is in the bumblebee options, that all.


As you can see there is many variable options, in fact you can write as many as you need. It's very useful to test all the tricks send in WinHQ or else where.
You finally keep the ones really needed.

## Xrandr
There is also an **xrandr** option.

For a classic app, this is unuseful, but for games it really could be.


Sometimes is better to set the desktop to the gameplay definition, this way you could get a smoother gameplay, better FPS, etc...

This option use the game *PID* to know when the game start and stop. This way it can reset the screen at your normal display res.

To discover the *PID*, the script need a *short word* extract usually from the real `.exe` game launcher. In the case of *Final Fantasy XIV*, there's 2, `ffxivlauncher.exe` and `ffxivboot.exe`, but both have `ffxiv`, so the short name is *ffxiv*.

*Final Fantasy XIV* has 3 screen mode: *fullscreen, windowed and borderless window*. This is in the last case the **xrandr** trick is very very useful for my small mobile Nvidia GPU.

Hope it would be for you too.

### Xrandr special
To get your default screen res, type in a terminal :
```sh
	xrandr --current | grep -w "connected"
```

The one with a res is your default(s). You just have now to set it in the conf file to the default reset point.

## Special thanks
To all the community and contributors of **WineHQ** that make the world goes round and made this work possible.

