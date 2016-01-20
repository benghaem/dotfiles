#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#exec gnome-session
# exec startkde
# exec startxfce4

#fix cursor
xsetroot -cursor_name left_ptr

#restart pulse
/usr/bin/start-pulseaudio-x11

#nonsxhkd keybinds
xbindkeys &

#set xresource settings
xrdb $HOME/.Xresources &

#start clipboard management
copyq &

#start xflux
xflux -z 22903 &

#start keepassx
#keepassx &

#start seafile
seafile-applet &

#deal with monitors
xrandr --output eDP1 --auto --primary
xrandr --output HDMI1 --auto --right-of eDP1
xrandr --output DP2 --auto --right-of eDP1
xrandr --addmode DP1 1920x1080
xrandr --output DP1 --mode 1920x1080 --right-of eDP1
#start locker
xautolock -time 1 -locker $HOME"/.bin/autoSuspend.sh" -detectsleep &
#set xautolock state
echo 'enabled' > $HOME/.bin/xautolock.state

#start notification server
dunst &

#start mopidy with anti-crash script that also fixes online problem
# $HOME/.bin/mopidyStart.sh &

#fix display thing
$HOME/.bin/echoDisplay.sh &

#start keybinds
sxhkd &
exec bspwm

#exec gnome-session
#exec startkde
