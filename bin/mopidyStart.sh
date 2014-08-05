#! /bin/sh

while [[ true ]]; do
	ping google.com -c 1 > /dev/null 2>&1
	if [ "$?" == "0" ]; then
		until [[ `mopidy --config /home/ben/.config/mopidy/mopidy_online.conf` ]]; do
		sleep 1;
		done
		#config = "/home/ben/.config/mopidy/mopidy_online.conf"
	else
		until [[ `mopidy --config /home/ben/.config/mopidy/mopidy_offline.conf` ]]; do
			sleep 1;
		done
		#config = "/home/ben/.config/mopidy/mopidy_offline.conf"
	fi
	
	sleep 1;
done
