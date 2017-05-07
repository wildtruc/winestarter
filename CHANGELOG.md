# Change log & reports
-----------
### Change Log
*( 07/05/17 ) v0.97* (minor fix)
 - winestarter_conf - Enhanced regedit regex filters to be more comprehensive with new dword csmt feature the old one erasing to much variables when modified.

*( 05/05/17 ) v0.97* (major fix)
 - Fixed bad Makefile end user behaviour (all my apology for this). I realize with the helping hand of a friend that install process was working nicely only on ma desktop :/
 
*( 30/04/17 ) v0.97*
 - winestarter_conf - Beginnig to create a 'extended' check box option for extended features (not available to end user yet), it will strongly increase the capacities of the scritpt.
 - winestarter_conf - Added the 'csmt' feature to registry entries (wine 2.6 update), it avoid staging csmt feature. Added a few other features to the registry configuration. Preparing extended features for more editable options (user & system).  It also possible now to add dword:xxxxxxxx class options.
 - winestarter_conf - Added a 'last wine version' info tag in may tab window.
 - Added a check box for "wine start" command. It's now possible to launch app from absolute path.
 - Color chooser now change also Script's popups.
 - winestarter_conf - Fixed edit_desktop for apps installed in C: root.   
 - winestarter - moved fn_regedit before winecfg launch.
 - A few fixes on mistakes, buggy filters and directives.
 
*( 17/04/17 ) v0.96*
 - winestarter - fixed winetricks function - merged winetricks log and winestarter log, this ways config file display all the dlls packages installed and not only thoses defined in the config file.
 - winestarter - added a info yad box on error or info (may be changed for a zenity one in the future).
 - winestarter_conf - fixed bad filter in install section - empty line was returning user home instead of nothing.
 
*( 15/04/17 ) v0.95*
 - Added multi install type to winestarter_conf ```_install``` section. This way, we can install now a software from an extractible (or auto-extractible) compressed format (zip, rar, 7z. Take care to have them installed)
 - Note: extraction command line for rar and 7zip could be faulty, I have no samples to test.
  
*( 10/04/17 ) v0.94*
 - Added a 'more packages' features to 'Install Software' section. This way, user could install associated dll packages or apps (ex: DX redist) without restart the configurator or the script a second times or more.
 - Add a scroll to the winestarter_conf window to gain place. There is alas a bug with optimus and xrandr tab (will fix ASAP)
 
*( 08/04/17 ) v0.93*
 - Modified and fix winetricks dlls installer in winestarter (fn_install_tricks). This way, installer just install missing dlls or newly added.
 - Modified and fix the way the script detect and link app dir to manage those installed in root (c:).
 - Fixed forgotten dir elf type in winestarter_conf reconf_wine function.
 - Usually, the app start independantly from the script. However, in some case it doesn't and mess up the pid detection. I fix it, now it does all the time.
 - Add a new filter for pid detection. I did test BF Bad Compagny 2. It appears this games needs to be launch to the desktop resolution to work properly and doesn't exit as Wine usaully do, that why I needed to do the above fix.
 - Winestarter's 'fn_game_dir_exist' wasn't reading custom app path as expected. Reworked on it and fix. Add a yad file chooser at this point to select .exe and dir when launched from Winestarter only.
 - Devel comments and adds are still uncleaned.

*( 02/04/17 ) v0.92*
 - Allowed Wine Custom binary to download and use 64bits. ltfp is not used anymore.
 - Add an initial window for fresh/import install. This is more confortable now to choose a custom app directory by init the new wine bottle first and preconfigure to choose the app dir and exe at the next step.
 - Add a "working" popup. Script work could be long.
 - Devel comments and adds are still uncleaned.
 - A few fixes.

*( 30/03/17 ) v0.91*
 - Started the versioning steps where v1.0 will be stable without known bugs.
 - Add 64bits start feature.
 - Put Wine custom binary in a separate tab.
 - A few fixes.

-----------
### Experienced
 - STEAM (2.4-staging) was fully installed and configured by the basic script on my desktop (32 and 64 bits Wine version).
 - TERA (2.4-staging) Online was installed successfuly too. But the game wont start because of a network issue.
 - FFXIV (2.4>2.5-staging) was installed earlier, but I spend my time to change many things for my debug purpose: desktop file,  icons, game directory, Wine binary, etc... And it still work great. It also work in Wine 64 with DX9, sadly it wont in DX11 because of a DX version check issue.
 - COD 4 MW (2.4-staging)was reconfigured by the script in 64. Perfect.
 - BF 3 (2.4-staging) installed with a few tricks. Work only over 64bits and DX11 (wine 2.4-staging). App launch in Wine windowed mode, alas, implementation of DX11 in Wine is not enough strong to manage many shaders and render is a crap.
 - FFXIV (2.5-staging) tested over DX11 succefuly by installing the DX redist package. Unfortunatly, when you go in the game itself occur the same shader issues. All the ATH is loaded, but no colors rendering in the game itself resulting in a dark shade of blacks.
 - BF 2 Bad company (2.4-staging), installed and working with a few tricks. Near perfect.
 - BF 1942 (2.4-staging) Forgotten Hope (from a contact demand). Game install nicely even the mod. The game wont launch if you're not in Windowed Wine mode and you have too launch from the game directory itself or with the "wine start" command. Still a few glitch
 - GTA IV (2.4-staging) installed and working. A few isuues with fps and images jump some times. Fully playable.
 - Interstellar Marines (2.4-staging) tested and working over STEAM64 bottle. Images jump some times, but render is almost better than the linux native build.
 - Medal of Honor 2010 (2.5-staging) - Didn't success to install with the ISO installation disc, even with PoL, maybe the ISO I got is buggy. So, I did install with a MS vbox VM on on external HDD. For this test, I wished to externalize all the stuff (wine bottle, game). Result is almost perfect. Note that the external drive is usb3, this make the game loading faster than the internal one (!?).
 - Tested FFXIV over Wine 2.6 (PoL) and registry csmt option. It seems to fully replace the staging csmt option. Curiously, I didn't have sound in DX9, but I had with DX11 (still dark shades).
  

