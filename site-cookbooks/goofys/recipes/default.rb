#
# Cookbook Name:: goofys
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{golang fuse}.each do |pkg|
	package pkg do
		action :install
	end
end



bash "setup goofys" do
	user "root"
	group "root"
	cwd "/root"
	environment "HOME" => '/root'
	environment "GOPATH" => '/root/go'
	code <<-EOC
		go get github.com/kahing/goofys
		go install github.com/kahing/goofys
	EOC
end


%w(ec2-user apl front).each do |username|↲
	»-directory "/home/#{username}/s3" do↲
	»-»-owner "#{username}"↲
	»-»-group "ec2-user"↲
	»-»-recursive false↲
	»-»-mode 0755↲
	»-»-action :create↲
	»-end↲
end

cookbook_file "/etc/fstab" do↲
»-source "fstab"↲
»-owner "root"↲
»-group "root"↲
»-mode "0644"↲
end↲
