#!/bin/sh
# Create user and set up the directorys
pw useradd -n sickrage -c "Sickrage" -s /sbin/nologin -w no
fetch https://github.com/SickRage/SickRage/archive/master.tar.gz
tar xfz master.tar.gz -C /usr/local/
mv /usr/local/SickRage-master /usr/local/sickrage
chown -R sickrage:sickrage /usr/local/sickrage
mkdir /usr/local/etc/rc.d

# Enable
sysrc -f /etc/rc.conf sickrage_enable="YES"

# Copy the init script where it's useful
cp /usr/local/sickrage/runscripts/init.freebsd /usr/local/etc/rc.d/sickrage
chmod +x /usr/local/etc/rc.d/sickrage

# Start the service
service sickrage start
