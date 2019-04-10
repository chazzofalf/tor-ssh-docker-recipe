#!/bin/bash
if [[ ! -z "$TOR_CONFIG_DIR" && -d "$TOR_CONFIG_DIR" ]]
then
	if [[ ! -e ${TOR_CONFIG_DIR}/hostname ]]
	then
		service ssh start
		service tor start 
		while [ ! -e /hidsrv/hostname ]
		do 
			echo waiting for hostname... 
			sleep 1
		done
	
		cp /hidsrv/hostname ${TOR_CONFIG_DIR}/hostname
		
	else
		if [[ ! -e /hidsrv/hostname ]]
		then
			cp ${TOR_CONFIG_DIR}/hostname /hidsrv/hostname
			chown debian-tor /hidsrv/hostname
			chmod 700 /hidsrv/hostname
		fi
		service ssh start
		service tor start
	fi
	echo tor hostname is `cat /hidsrv/hostname`
else
	echo \$HOSTNAME_DIR is not specified and/or mounted.
	return 1
fi
