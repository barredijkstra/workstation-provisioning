#!/usr/bin/env bash
sudo /opt/puppetlabs/bin/puppet apply --noop --test --hiera_config hiera.yaml --modulepath ./modules:/etc/puppetlabs/code/environments/production/modules manifests
