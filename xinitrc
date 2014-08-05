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
xbindkeys

#start clipboard management
copyq &

#start xflux
xflux -z 22903 &

#start seafile
seafile-applet &

#deal with monitors
xrandr --output eDP1 --auto --primary
#xrandr --output HDMI1 --auto --right-of eDP1

#start locker
xautolock -time 3 -locker "/home/ben/.bin/autoSuspend.sh" -detectsleep &
#set xautolock state
echo 'enabled' > /home/ben/.bin/xautolock.state

#start mopidy with anti-crash script that also fixes online problem
/home/ben/.bin/mopidyStart.sh &

#start panel
#/home/ben/.bin/panel/panel &

#start keybinds
sxhkd &
exec bspwm

#start panel
# ...or the Window Manager of your choice
