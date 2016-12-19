#!/usr/bin/env bash

echo "Disabling unattended-upgrade"
sudo sed -e '/APT::Periodic/ s/"1"/"0"/g' -i /etc/apt/apt.conf.d/10periodic
sudo sed -e '/^\/\//! {/"${distro_id}:${distro_codename}/ s/^/\/\//}' -i /etc/apt/apt.conf.d/50unattended-upgrades
if [ "$(pidof unattended-upgrade)" ]; then
    echo "Killing unattended-upgrade process"
    sudo killall -9 unattended-upgrade
fi

exit 0