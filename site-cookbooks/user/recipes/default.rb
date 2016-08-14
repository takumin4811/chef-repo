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
		group "ec2-user"
		home "/home/front"
		shell "/bin/bash"
		password "$1$tGxxvsuw$9xaphwwvqiAeeRyMvKYs40"
		action [:create,:manage]
		supports :manage_home => true
end



user "apl" do 
		comment "apl"
		group "ec2-user"
		home "/home/apl"
		shell "/bin/bash"
		password "$1$SU1jKO3a$NsZySX9Rp9s0APuwVHA.w0"
		action [:create,:manage]
		supports :manage_home => true
end


%w(ec2-user apl front).each do |username|

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
					ls 
					pwd
					sh dotfiles/setup.sh
			EOC
	end

end


