# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Disksize
  config.disksize.size = '30GB'
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 81, host: 81
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 19999, host: 19999
  config.vm.network "forwarded_port", guest: 9001, host:9001

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  #config.vm.provision :shell, :path => "install.sh"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "./", "/home/vagrant/workspace" , :mount_options => ["dmode=777", "fmode=766"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  # Enable Dynamic Swap Space to prevent Out of Memory crashes
  config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install swapspace python python3-pip python-dev libmysqlclient-dev python3-venv  build-essential libssl-dev libffi-dev unzip -y"

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  #config.vm.provision "shell", inline: <<-SHELL
  #SHELL

  # Mysql Part
  $script_mysql = <<-SCRIPT
    apt-get update && \
    apt-get install -y openjdk-8-jdk  mysql-server-5.7 && \
    mysql -e "create user 'devops'@'%' identified by 'mestre';"  && \
    mysql -e "create user 'devops_dev'@'%' identified by 'mestre';"  && \
    mysql -e "create database todo;" && \
    mysql -e "create database todo_dev;" && \
    mysql -e "create database test_todo_dev;" && \
    mysql -e "grant all privileges on *.* to devops@'%' identified by 'mestre';" && \
    mysql -e "grant all privileges on *.* to devops_dev@'%' identified by 'mestre';" 
  SCRIPT
  config.vm.provision "shell", inline: $script_mysql
  config.vm.provision "shell",
    inline: "cat /configs/mysqld.cnf > /etc/mysql/mysql.conf.d/mysqld.cnf"
  config.vm.provision "shell",
    inline: "service mysql restart"
  config.vm.synced_folder "./configs", "/configs"

# Extra
  config.vm.provision "shell",
    inline: "chmod +x /vagrant/scripts/*"
  config.vm.provision "shell",
	inline: "sudo /vagrant/scripts/docker.sh"
end
