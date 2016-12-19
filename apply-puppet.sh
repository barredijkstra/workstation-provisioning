#!/usr/bin/env bash

declare -A MODULES=(
    ['attachmentgenie-locales']='latest'
    ['bashtoni-timezone']='latest'
    ['garethr-docker']='latest'
    ['maestrodev-wget']='latest'
    ['paulosuzart-sdkman']='latest'
    ['puppet-archive']='latest'
    ['puppet-nodejs']='latest'
    ['puppetlabs-apt']='latest'
    ['puppetlabs-stdlib']='latest'
    ['zanloy-ohmyzsh']='latest'
)
declare -A INSTALLED_MODULES
function load_modules_versions {
    MODULE_LIST=( $(sudo /opt/puppetlabs/bin/puppet module list | grep "──" | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | cut -c 11- | sed 's/(v//g;s/)//g') )
    COUNT=${#MODULE_LIST[@]}
    for (( i=0; i<${COUNT}; i=$i+2 )); do
        INSTALLED_MODULES[${MODULE_LIST[$i]}]=${MODULE_LIST[$i+1]}
    done
}
load_modules_versions

echo "Ensuring installation of ${#MODULES[@]} forge based puppet modules"
for MODULE in ${!MODULES[@]}; do
    MOD_VERSION="${INSTALLED_MODULES[$MODULE]}"
    REQ_VERSION="${MODULES[$MODULE]}"
    if [ "" == "$REQ_VERSION" ]; then
        REQ_VERSION="latest"
    fi
    echo "Checking installation state of puppet module ${MODULE} (version: ${REQ_VERSION})"
    if [ "" == "$MOD_VERSION" ] && [ "latest" == "$REQ_VERSION" ]; then
        echo "Installing latest version of puppet module ${MODULE}"
        sudo /opt/puppetlabs/bin/puppet module install $MODULE
    elif [ "" == "$MOD_VERSION" ]; then
        echo "Installing version ${REQ_VERSION} of puppet module ${MODULE}"
        sudo /opt/puppetlabs/bin/puppet module install $MODULE --version $REQ_VERSION
    elif [ ! "latest" == "$REQ_VERSION" ] && [ ! "$MOD_VERSION" == "$REQ_VERSION" ]; then
        echo "Updating puppet module ${MODULE} from version ${MOD_VERSION} to version ${REQ_VERSION}"
        sudo /opt/puppetlabs/bin/puppet module install $MODULE --version ${REQ_VERSION} --force
    else
        echo "Puppet module ${MODULE} already installed with version ${MOD_VERSION}"
    fi
done

# Verify installation of modules
load_modules_versions
for MODULE in ${!MODULES[@]}; do
    MOD_VERSION="${INSTALLED_MODULES[$MODULE]}"
    REQ_VERSION="${MODULES[$MODULE]}"
    if [ "" == "$MOD_VERSION" ] || ( [ ! "latest" == "$REQ_VERSION" ] && [ ! "$MOD_VERSION" == "$REQ_VERSION" ] ); then
        echo "Failed to install version ${REQ_VERSION} (installed version: ${MOD_VERSION}) of puppet module ${MODULE}, aborting..."
        exit -1
    fi
done


#sed 's/$/ /' |
SERVER_IPS=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | tr '\n' ' '`
echo "Provisioning machine ${HOSTNAME} ( ${SERVER_IPS})"
sudo /opt/puppetlabs/bin/puppet apply --hiera_config hiera.yaml --modulepath ./modules:/etc/puppetlabs/code/environments/production/modules manifests

exit 0