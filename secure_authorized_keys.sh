#!/bin/bash
if [[ ! -e /home/$XDOCKERUSER/.ssh/authorized_keys ]]
then
	if [[ ! -e ${TOR_CONFIG_DIR}/hostname ]]
	then
		rm ${TOR_CONFIG_DIR}/torlogin
	fi
	if [[ ! -e ${TOR_CONFIG_DIR}/torlogin ]]
	then
		ssh-keygen -t rsa -b 4096 -f ${TOR_CONFIG_DIR}/torlogin -P ""
	fi
	cat ${TOR_CONFIG_DIR}/torlogin.pub > /home/$XDOCKERUSER/.ssh/authorized_keys
	chmod 700 /home/$XDOCKERUSER/.ssh/authorized_keys
	chown $XDOCKERUSER /home/$XDOCKERUSER/.ssh/authorized_keys
fi
