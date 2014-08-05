#! /bin/sh

#Don't suspend when these are running
WHITELIST=("GoogleTalkPlug" "")
#Don't lock screen when these are running
SCREENONLIST=("GoogleTalkPlug" "")
CANCELONMUSIC=true
CANCEL=false
STATEFILE=$HOME/.bin/xautolock.state
STATE=`cat $STATEFILE`

#Check Statefile for notification state
if [[ $STATE == "disabled" ]]; then
	exit 0
fi

#Check if screenon programs are running
for i in ${SCREENONLIST[@]}; do
	pgrep $i > /dev/null 2>&1
	#if we find one exit script
	if [ "$?" == "0" ]; then
		exit 0
	fi
done

#Check if whitelist programs are running
for i in ${WHITELIST[@]}; do
	pgrep $i > /dev/null 2>&1
	if [ "$?" == "0" ]; then
		CANCEL=true
	fi
done

#Check for MPD server playing music
if [[ $CANCELONMUSIC == true ]]; then
	MPD_RAW="$(mpc)"
	MPD_STATE="$(echo "$MPD_RAW" | head -n 2 | tail -n 1 | awk '{gsub("\\[", ""); gsub("\\]", ""); print $1}')"
	if [[ $MPD_STATE == "playing" ]]; then
		CANCEL=true
	fi

fi

#Execute Options
if [[ $CANCEL == true ]]; then
	sleep 2s;
	xset dpms force off;
	/usr/bin/sxlock -f -*-terminus-*-r-*-*-32-*-*-*-*-*-*-* &
else
	systemctl suspend
fi

