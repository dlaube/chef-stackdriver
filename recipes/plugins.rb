#
# Cookbook Name:: stackdriver
# Recipe:: plugins
# License:: MIT License
#
# Copyright 2013, StackDriver
#
# All rights reserved
#


node['stackdriver']['plugins']['active'].each do |plugin|
  template "/opt/stackdriver/collectd/etc/collectd.d/#{plugin}.conf" do
    source "#{plugin}.conf.erb"
    mode "0644"
    owner "root"
    group "root"
    action :create
  end
  node['stackdriver']['plugins']["#{plugin}"]['requires'].each do |package|
    yum_package "#{package}"
  end
end


if node['stackdriver']['plugins']['active'].include?('tomcat')
    include_recipe "stackdriver::jmxtrans"
end

if node['stackdriver']['plugins']['active'].include?('nginx') and node['stackdriver']['plugins']['nginx']['add_nginx_status_endpoint']
  template "/etc/nginx/conf.d/stackdriver_status.conf" do
    source "nginx.status.conf.erb"
    mode "0644"
    owner "root"
    group "root"
    action :create
  end
end

service "stackdriver-agent" do
  action :restart
end
