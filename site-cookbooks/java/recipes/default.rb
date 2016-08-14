#
# Cookbook Name:: tree
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "java-1.8.0-openjdk-devel.x86_64" do 
 action [ :install, :upgrade]
end

package "java-1.7.0-openjdk" do 
 action [:remove]
end

