#
# Cookbook Name:: stackdriver
# Recipe:: repo 
# License:: MIT License
#
# Copyright 2013, StackDriver
#
# All rights reserved 
#

# Re-make the yum cache vi command resource
execute "create-yum-cache" do
 command "yum -q makecache"
 action :nothing
end

# Reload the yum cache using the Chef provider
ruby_block "internal-yum-cache-reload" do
  block do
    Chef::Provider::Package::Yum::YumCache.instance.reload
  end
  action :nothing
end

# Create the StackDriver yum repo file in yum.repos.d
cookbook_file "/etc/yum.repos.d/stackdriver.repo" do
  source "stackdriver.repo"
  mode 00644
  notifies :run, "execute[create-yum-cache]", :immediately
  notifies :create, "ruby_block[internal-yum-cache-reload]", :immediately
end


