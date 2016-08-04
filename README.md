# chef-repo

##最初のセットアップ手順についてのメモ

	#/bin/sh

	echo "this is first setup script for iaas server"

	sudo cp -p /usr/share/zoneinfo/Japan /etc/localtime

	sudo yum -y update
	sudo yum groupinstall -y "Development Tools"

	mkdir ./rpm.d
	wget https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.rpm -P ./rpm.d
	sudo rpm -Uvh ./rpm.d/vagrant_1.8.5_x86_64.rpm

	vagrant plugin install sahara
	vagrant plugin install vagrant-aws
	vagrant plugin install vagrant-omnibus
	vagrant plugin list

	sudo rpm -Uvh 
	wget https://packages.chef.io/stable/el/6/chefdk-0.16.28-1.el6.x86_64.rpm -P ./rpm.d
	sudo rpm -Uvh ./rpm.d/chefdk-0.16.28-1.el6.x86_64.rpm

	chef gem install knife-solo

	knife solo init ./chef-solo/



