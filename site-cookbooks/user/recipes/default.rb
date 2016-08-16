#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


user "front" do
		comment "front"
		uid "501"
		group "ec2-user"
		home "/home/front"
		shell "/bin/bash"
		password "$1$tGxxvsuw$9xaphwwvqiAeeRyMvKYs40"
		action [:create,:manage]
		supports :manage_home => true
end



user "apl" do
		comment "apl"
		uid "502"
		group "ec2-user"
		home "/home/apl"
		shell "/bin/bash"
		password "$1$SU1jKO3a$NsZySX9Rp9s0APuwVHA.w0"
		action [:create,:manage]
		supports :manage_home => true
end



