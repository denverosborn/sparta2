#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

# Location of the user's ssh keys (according to the running sshd_config)
AUTHKEYS=~/$(sshd -T|awk '/authorizedkeysfile/{print $2}')
KEYDIR=${AUTHKEYS%/*}

# Location of the container's ssh keys
UTILKEYDIR=~/ssh-keys
PRVKEY=${UTILKEYDIR}/utility
PUBKEY=${PRVKEY}.pub

# Create dirs if they do not exist, then generate the ssh kay pair used by the utility container
# Note: this permits the root user in the container login ia ssh-key to the host.
test -d ${KEYDIR} || mkdir -pv ${KEYDIR} && chmod 700 ${KEYDIR}
test -d ${UTILKEYDIR} || mkdir -pv ${UTILKEYDIR} && chmod 700 ${UTILKEYDIR}
test -f ${PRVKEY} || ssh-keygen -b 2048 -t rsa -f ${PRVKEY} -q -N "" && cat ${PUBKEY} >> ${AUTHKEYS}
