#!/usr/bin/env bash

RELEASE_PACKAGE=pc1
UBUNTU_CODENAME=`awk -F'[=]' '/VERSION_CODENAME=/{print $2}' /etc/os-release`
DEB_FILE="puppetlabs-release-${RELEASE_PACKAGE}-${UBUNTU_CODENAME}.deb"
DEB_URL="https://apt.puppetlabs.com/${DEB_FILE}"
DEB_PATH="/tmp"
PUPPET_AGENT_INSTALLED=`dpkg-query -W --showformat='${Status}\n' puppet-agent | grep "install ok installed"`
PUPPET_INSTALLED=`dpkg-query -W --showformat='${Status}\n' puppet | grep "install ok installed"`
if [ ! "" == "$PUPPET_INSTALLED" ]; then
    echo "Ubuntu puppet package installed, purging..."
    sudo apt-get purge puppet
fi

if [ "" == "$PUPPET_AGENT_INSTALLED" ]; then
    echo "Installing puppet-agent from debian package ${DEB_URL} (${DEB_PATH})"
    mkdir -p ${DEB_PATH}
    if [ ! -f "${DEB_PATH}/${DEB_FILE}" ]; then
        wget ${DEB_URL} --directory-prefix ${DEB_PATH}
    fi
    sudo dpkg -i ${DEB_PATH}/${DEB_FILE}
    sudo apt-get update
    echo "Added apt repository from ${DEB_PATH}/${DEB_FILE}"

    sudo apt-get --no-install-recommends --no-install-suggests -y install puppet-agent
    echo "Installed puppet-agent"
fi

PUPPET_PKG_VERSION=`dpkg-query --showformat='${Version}' --show puppet-agent`
PUPPET_VERSION=`/opt/puppetlabs/bin/puppet --version`
echo "Running machine with puppet-agent version ${PUPPET_VERSION} from package ${PUPPET_PKG_VERSION}"

exit 0