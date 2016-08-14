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
	user "ec2-user"
	group "ec2-user"
	cwd "/home/ec2-user"
	environment "HOME" => '/home/ec2-user'
	environment "GOPATH" => '/home/ec2-user/go'
	code <<-EOC
		go get github.com/kahing/goofys
		go install github.com/kahing/goofys
		S3_MOUNT_NAME='/mnt/s3'
		S3_BUCKET_NAME='mystrage1'
		mkdir  /mnt/s3
		${GOPATH}/bin/goofys ${S3_BUCKET_NAME} ${S3_MOUNT_NAME} -o allow_other,--uid=500,--gid=500

	EOC
end
