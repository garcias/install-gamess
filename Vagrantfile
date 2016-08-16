# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.0.1.222"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.vm.provider :virtualbox do |v|
    v.name = "GAMESS"
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision "shell", privileged: true, inline: $SYSTEM_PREP
  config.vm.provision "shell", privileged: false, inline: $BUILD_PREP

end

$SYSTEM_PREP = <<SCRIPT

# Using 3/4 GB for shared memory
SHARED_MAX=$((768 * 1024 * 1024))
SHARED_ALL=$((768 * 1024 * 1024 / 4096))

# Update apt-get and install basic tools and libraries
apt-get update -qq
apt-get install -y gfortran csh xauth git curl
apt-get install -y libblas-dev libatlas-base-dev

echo "Setting shmmax to $SHARED_MAX"
echo "Setting shmall to $SHARED_ALL"
echo "kernel.shmmax = $SHARED_MAX" >> /etc/sysctl.conf
echo "kernel.shmall = $SHARED_ALL" >> /etc/sysctl.conf
sysctl -p

# Install Java runtime, Jmol, and OpenBabel
apt-get install -y default-jre jmol openbabel

SCRIPT


$BUILD_PREP = <<SCRIPT

cd ~
cp /vagrant/gamess-built.tar.gz ./
cp /vagrant/install-gamess.sh ./
chmod u+x install-gamess.sh

SCRIPT

