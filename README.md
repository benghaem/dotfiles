#dotfiles

##About

This is a collection of dotfiles for use with BSPWM or any other window manager that requires the use of a dzen panel. It is my personal configuration and includes all of the features I find necessary for a full WM experience. The collection also includes a small C program at bin/panel/scroller. This program takes a string input, a prefix, and a width and will output text that gives the appearance of scrolling. This is used for the music/mpd integration aspect of the panel where long song names will be scrolled instead of truncated. 

##Screenshots

![Example](/scrots/example.gif)
![Clean](/scrots/clean.png)
![Dirty](/scrots/dirty.png)

##Requirements
###General
* bspwm
* compton
* dmenu (with xft and height patch)
* dunst
* feh
* sxhkd
* xbindkeys
* xrandr (Set Primary Monitor)

###Panel
* acpi 					 (Battery)
* bc 				(Various Math)
* Dejavu Sans Mono (Panel Font)
* dnsutils (Network External IP)
* dzen2 				   (Panel)
* iw (Network SSID)
* lm_sensors 			(CPU Temp)
* mpc 	(MPD Server Communication)
* pamixer (Volume Notification)
* trayer 	   (Tray Icon Display)
* xset (Caps Lock Notification)

####Optional
* amixer (Mic Mute)
* txtw (To determine offset)
* lxrandr (Projector/Display Keybind)

###Music
* Mopidy or MPD (Music Server)
* ncmpcpp (MPD Controller)

###Other useful programs
* CopyQ (Clipboard Manager)
* seafile (Self Hosted Cloud Storage)
* sxlock (Screen Locker)
* urxvt (Terminal)
* xautolock (Auto Suspend System)
* xflux (Gamma Adjustment)

##Installation

###General
Assuming that all required programs are installed, the dotfiles can simply be moved to their respective locations followed by a restart of the X server. I use symlinks to keep my file system organized so that all of these files live within the folder `.dotfiles` in my home directory.

Required symlinks are as follows:

* `ln -s ~/.dotfiles/bin ~/.bin`
* `ln -s ~/.dotfiles/bspwm ~/.config/bspwm`
* `ln -s ~/.dotfiles/compton ~/.config/compton`
* `ln -s ~/.dotfiles/dunst ~/.config/dunst`
* `ln -s ~/.dotfiles/ncmpcpp/ ~/.ncmpcpp`
* `ln -s ~/.dotfiles/Xresources ~/.Xresources`
* `ln -s ~/.dotfiles/xbindkeysrc ~/.xbindkeysrc`
* `ln -s ~/.dotfiles/xinitrc ~/.xinitrc`

After the files are moved/symlinked please read the configuration section below

###Suspend Service
The `suspend@.service` should be moved to `/etc/systemd/system/` and enabled with `systemctl enable suspend@user.service` as root. The service relies on `bin/echoDisplay.sh` to create `/tmp/DISPLAY.env` to ensure that sxlock is able to find the required display.

###Mopidy
If you are planning to use `mopidyStart.sh` to start Mopidy in online or offline modes until plugin support improves, you will need to create your own configs for these states and move them to `~/.config/mopidy/mopidy_offline.conf` and `~/.config/mopidy/mopidy_online.conf`. I recommend using the same settings and disabling any plugins that connect to the Internet in the offline version of the config file. 

###GTK Themes
I use `numix-themes-archblue` from the AUR along with the Numix icon theme.

###Wallpaper
My current wallpaper:
http://wallpapers.wallbase.cc/rozne/wallpaper-1976574.jpg

##Configuration

###Panel
The panel can be configured from the variable file located at `bin/panel/panel_settings` where some settings, such as `DUAL_BATT`, may need to be changed to match your system configuration. The panel and notifications are based off of a screen resolution of 1920x1080. If you do not have a screen of this size `panel_settings` and all of the `_not` files will need to be modified to support alternate sizes.

Additional color configuration is available at `bin/panel/panel_colors-dzen`.

###Keybinds
Keybinds can be modified in the `xbindkeysrc` and `sxhkd/sxhkdrc` files. 

###Background
Feh uses any file located at `~/Pictures/Wallpaper/current`.

###Auto Suspend
The auto suspend settings can be modified at `bin/autoSuspend.sh`.

__NOTE: The fullscreen setting only works for BSPWM__

###xinitrc
My xinitrc launches a few applications you may not use. Simply remove them from the list and add your own.