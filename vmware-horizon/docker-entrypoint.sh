#!/bin/sh

/usr/lib/vmware/view/usb/vmware-usbarbitrator & 
sleep 5 
chmod 777 /var/run/vmware/usbarbitrator-socket

su vmwareuser sh -c "/usr/bin/vmware-view --save"
