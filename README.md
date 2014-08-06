#dotfiles

##About

This is a collection of dotfiles for use with BSPWM or any other window manager that requires the use of a dzen panel. It is my personal configuration and includes all of the features I find necessary for a full WM experience. The collection also includes a small C program at bin/panel/scroller. This program takes a string input, a prefix, and a width and will output text that gives the appearance of scrolling. This is used for the music/mpd integration aspect of the panel where long song names will be scrolled instead of truncated. 

##Requirements
###General
* bspwm
* compton
* sxhkd
* xbindkeys
* dmenu
* dunst

###Panel
* acpi 					 (Battery)
* bc 				(Various Math)
* Dejavu Sans (Panel Font)
* dnsutils (Network External IP)
* dzen2 				   (Panel)
* iw (Network SSID)
* lm_sensors 			(CPU Temp)
* mpc 	(MPD Server Communication)
* pamixer (Volume Notification)
* trayer 	   (Tray Icon Display)
* xset (Caps Lock Notification)

###Music
* Mopidy or MPD (Music Server)
* ncmpcpp (MPD Controller)

###Other useful programs
* CopyQ (Clipboard Manager)
* sxlock (Screen Locker)
* urxvt (Terminal)
* xautolock (Auto Suspend System)

##Configuration

The panel can be configured from the variable file located at `bin/panel/panel_settings`. The panel and notifications are based off of a screen resolution of 1920x1080. If you do not have a screen of this size `panel_settings` and all of the `_not` files will need to be modified to support alternate sizes.

Otherwise minimal configuration of `xinitrc` may be required.