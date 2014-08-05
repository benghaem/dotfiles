#! /bin/sh

STATEFILE=$HOME/.bin/xautolock.state
STATE=`cat $STATEFILE`

if [[ $STATE = "disabled" ]]; then
	echo "enabled" > $STATEFILE
	PID="$( pgrep dzen | xargs ps | grep popup_xautolock_indicator_dzen2_safe | awk '{print $1}' )"
		if [[ $PID ]]; then
			kill $PID
		fi
fi
if [[ $STATE = "enabled" ]]; then
	echo "disabled" > $STATEFILE
	$HOME/.bin/panel/dzen_xautolock_not &
fi
