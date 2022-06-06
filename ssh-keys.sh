#!/bin/bash

mkdir -pv $HOME/ssh-keys

ssh-keygen -b 2048 -t rsa -f $HOME/ssh-keys/utility -q -N ""

cat $HOME/ssh-keys/utility.pub >> $HOME/.ssh/authorized_keys

