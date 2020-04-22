#!/usr/bin/env bash

cd "$(dirname "$0")"

hostname="$1"

# set hostname
echo "$hostname" > /etc/hostname

# scramble the pi password
# password_pi="$(openssl rand -base64 64 | tr -d '\n')"
# echo "pi:$password_pi" | chpasswd

# packages
apt update
apt install -y \
	network-manager
apt purge -y openresolv dhcpcd5

# SSH
mkdir -p ~/.ssh/
install -m 600 ./authorized_keys ~/.ssh/
systemctl enable ssh

# NetworkManager
mkdir -p /etc/NetworkManager/system-connections/
install -m 600 system-connections/* /etc/NetworkManager/system-connections/
systemctl enable NetworkManager
