#
# Cookbook Name:: vim-dein
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
:#

bash "setup dein and vim plugins" do
	user "root"
	group "root"
	cwd "/root"
	environment "HOME" => '/root'
	code <<-EOC
			mkdir -p /opt/vim/plugins
			cd /opt/vim
			curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh↲
			sh installer.sh /opt/vim/plugins
			cd



	EOC
