#!/bin/bash
if [[ ! -e ${TOR_CONFIG_DIR}/hostname ]]
then
	rm /etc/ssh/ssh_host_*key*
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -P ""
	ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -P ""
	ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P ""
	ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -P ""
	

fi

