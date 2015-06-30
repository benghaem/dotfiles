#! /bin/sh

while [[ true ]]; do
	ping google.com -c 1 > /dev/null 2>&1
	if [ $? == "0" ]; then
		mopidy --config /home/ben/.config/mopidy/mopidy_online.conf
		sleep 1;
		#config = "/home/ben/.config/mopidy/mopidy_online.conf"
	else
		mopidy --config /home/ben/.config/mopidy/mopidy_offline.conf
		sleep 1;
		#config = "/home/ben/.config/mopidy/mopidy_offline.conf"
	fi
	sleep 1;
done
