#!/usr/bin/env bash
set -e

echo ":::: Running as user $(whoami) ... "
id
echo ":::: Home dir: $HOME ..."

## Disable selinux
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

## Upgrade all packages
sudo yum upgrade -y
sudo yum install -y cloud-utils-growpart
sudo yum groupinstall -y "Server with GUI"
sudo systemctl set-default graphical
