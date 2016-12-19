#!/usr/bin/env bash

cd /vagrant
./disable-unattended-upgrade.sh
./install-puppet-agent.sh
./apply-puppet.sh

