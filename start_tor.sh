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
		cp /hidsrv/hs_ed25519_public_key ${TOR_CONFIG_DIR}/hs_ed25519_public_key
		cp /hidsrv/hs_ed25519_secret_key ${TOR_CONFIG_DIR}/hs_ed25519_secret_key
	else
		if [[ ! -e /hidsrv/hostname ]]
		then
			cp ${TOR_CONFIG_DIR}/hostname /hidsrv/hostname
			cp ${TOR_CONFIG_DIR}/hs_ed25519_public_key /hidsrv/hs_ed25519_public_key
			cp ${TOR_CONFIG_DIR}/hs_ed25519_secret_key /hidsrv/hs_ed25519_secret_key
			chown debian-tor:debian-tor /hidsrv/hostname
			chmod 600 /hidsrv/hostname
			chown debian-tor:debian-tor /hidsrv/hs_ed25519_public_key
			chmod 600 /hidsrv/hs_ed25519_public_key
			chown debian-tor:debian-tor /hidsrv/hs_ed25519_secret_key
			chmod 600 /hidsrv/hs_ed25519_secret_key
		fi
		service ssh start
		service tor start
	fi
	echo tor hostname is `cat /hidsrv/hostname`
else
	echo \$HOSTNAME_DIR is not specified and/or mounted.
	return 1
fi
