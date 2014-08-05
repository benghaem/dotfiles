#! /bin/sh

# launch or kill trayer

CMD="trayer --align right --width 90 --widthtype pixel --edge top --height 22 --alpha 0 --tint 0x1e1e1e --transparent true --margin 15"

if [ $(pidof trayer) ] ; then
  killall trayer -u $USER;
else
  $CMD &
fi

