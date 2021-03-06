#!/bin/bash

# Stop on the first sign of trouble
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

echo "Set Root File System in Read Only Mode"

mount -o remount,rw /boot
sed -i "s,init=/sbin/init,init=/sbin/overlayRoot.sh," /boot/cmdline.txt

#echo "The system will reboot in 5 seconds..."
#sleep 5
#shutdown -r now
