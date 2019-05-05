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
		cp /hidsrv/private_key ${TOR_CONFIG_DIR}/private_key		
	else
		if [[ ! -e /hidsrv/hostname ]]
		then
			cp ${TOR_CONFIG_DIR}/hostname /hidsrv/hostname
			cp ${TOR_CONFIG_DIR}/private_key /hidsrv/private_key
			chown debian-tor:debian-tor /hidsrv/hostname
			chmod 600 /hidsrv/hostname
			chown debian-tor:debian-tor /hidsrv/private_key
			chmod 600 /hidsrv/private_key
		fi
		service ssh start
		service tor start
	fi
	echo tor hostname is `cat /hidsrv/hostname`
else
	echo \$HOSTNAME_DIR is not specified and/or mounted.
	return 1
fi
