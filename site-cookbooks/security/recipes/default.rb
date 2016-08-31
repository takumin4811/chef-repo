#
# Cookbook Name:: security
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


%w(ec2-user apl front).each do |username|

	directory "/home/#{username}/.ssh" do
		owner "#{username}"
		group "ec2-user"
		recursive false
		mode 0700
		action :create
	end

	cookbook_file "/home/#{username}/.ssh/myfirstkey.pem" do
		source "ssh/myfirstkey.pem"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end

	cookbook_file "/home/#{username}/.ssh/id_rsa" do
		source "ssh/id_rsa"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end

	cookbook_file "/home/#{username}/.ssh/github" do
		source "ssh/github"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end

	cookbook_file "/home/#{username}/.ssh/config" do
		source "ssh/config"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end


	directory "/home/#{username}/.bash_profile.d" do
		owner "#{username}"
		group "ec2-user"
		recursive false
		mode 0755
		action :create
	end


	cookbook_file "/home/#{username}/.bash_profile.d/aws_secret.sh" do
		source "aws_secret"
		owner "#{username}"
		group "ec2-user"
		mode "0777"
	end


	directory "/home/#{username}/.aws" do
		owner "#{username}"
		group "ec2-user"
		recursive false
		mode 0755
		action :create
	end

	cookbook_file "/home/#{username}/.aws/config" do
		source "/awsconfig/config"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end

	cookbook_file "/home/#{username}/.aws/credentials" do
		source "/awsconfig/credentials"
		owner "#{username}"
		group "ec2-user"
		mode "0600"
	end

	git "/home/"+username+"/dotfiles" do
			repository "https://github.com/takumin4811/dotfiles.git"
			reference "master"
			action :sync
			user username
			group "ec2-user"
	end

	bash "setup dotfiles" do
			user username
			group "ec2-user"
			cwd "/home/"+username
			environment "HOME" => '/home/'+username
			code <<-EOC
					cd dotfiles
					sh ./setup.sh
					git remote set-url origin git@github.com:takumin4811/dotfiles.git
					cd ../
			EOC
	end

end

bash "root profile" do
		user "root"
		group "root"
		code <<-EOC
				cp -r /home/ec2-user/.ssh /root/
				cp -r /home/ec2-user/.vimrc /root/
				cp -r /home/ec2-user/.aws /root/
		EOC
end

