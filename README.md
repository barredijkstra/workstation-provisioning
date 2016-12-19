# Puppet-based workstation provisioning

Puppet project for provisioning my personal workstations, allowing for updating of the machine through puppet.

This project is written for the latest Ubuntu LTS (xenial). It might work on other distros/versions, but is currently untested.

This project started as a fork of [github.com/nightwhistler] but ended up being a full rewrite (hence why the fork link was removed)

## Details

The provisioning is written for Ubuntu Xenial LTS and provides a Java/Scala development workstation running ubuntu-desktop (unity).

Main components:
- Java development stack wit IntelliJ IDEA
- Scala development stack
- Docker stack (without kubernetes)
- VirtualBox/ vagrant
- Standard office/internet applications.

## How to set up a new machine

 1. Pick a hostname.
 2. Install the machine (basic Ubuntu install; next, next, finish)
 3. Install git and checkout or download and unzip this project
 4. Update `hieradata/defaults.yaml` or create `hieradata/node/<machine-name>.yaml` to set the desired settings.
 4. Run `./provision.sh`; this will install puppet (`install-puppet-agent.sh`) and provision the machine (`apply-puppet.sh`).
 6. Start the installed owncloud sync client to sync the dotFiles folder 
 7. Symlink the dotFiles to the root of the user's home folder
 8. Profit :)

## Known issues

 - Adding apt-repos are not always triggering an apt-get update causing a failed install of a program. Running provision.sh a 2nd time should fix the failed installs.
 - sdkman provides `sdk` as a function (not executable), not allowing for easy installation of packages through sdkman
 - currently scala/maven/gradle/sbt installation fails due to sdkman problem.
 - zsh settings are only initialised on first login for a user (for example `~/.zshrc`), this makes adding certain configuration (e.g. sdkman parameters) tricky.


## Todo

- Refactor installation of packages and repositories to collecting and bulk execution.
- Add installation stages
- Added support for creation (and change collection) of multiple users.
- Refactor bash installation to use bash/zsh/whatever.
- Add installer for java jar applications.
- Add support for different desktops.
- Add support for installing (3rd party) drivers and per node/facter-based selection.
- Add install package for robomongo (https://robomongo.org/)
- Add install package for yed GraphEditor (https://www.yworks.com/downloads#yEd)
