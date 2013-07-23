#
# Cookbook Name:: stackdriver
# Recipe:: default
# License:: MIT License
#
# Copyright 2013, Stackdriver
#
# All rights reserved 
#
include_recipe "stackdriver::repo"

# Install the stack driver agent
package "stackdriver-agent" do
  action :install
end

# Create or update the stackdriver-agent config
template "/etc/sysconfig/stackdriver" do
  source "stackdriver.sysconfig.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
end

# Enable and start the service
service "stackdriver-agent" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

