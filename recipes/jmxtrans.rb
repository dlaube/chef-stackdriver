#
# Cookbook Name:: stackdriver
# Recipe:: default
# License:: MIT License
#
# Copyright 2013, Stackdriver
#
# All rights reserved
#
# Sets up jmxtrans for the tomcat monitoring plugin
# See: http://feedback.stackdriver.com/knowledgebase/articles/244387-tomcat-monitoring
# And: https://github.com/Stackdriver/jmxtrans-config-stackdriver

["/mnt/jmxtrans", "/mnt/jmxtrans/conf", "/mnt/jmxtrans/log"].each do |dirname|
  directory "#{dirname}" do
    owner "root"
    group "root"
    mode 00755
    action :create
  end
end

template "/mnt/jmxtrans/conf/tomcat7.json" do
  source "jmxtrans-tomcat7.json.erb"
  mode 00644
  owner "root"
  group "root"
  action :create
end

remote_file "/mnt/jmxtrans/jmxtrans-all.jar" do
  source "#{node['stackdriver']['plugins']['tomcat']['jmxtrans_jar_url']}"
  owner "root"
  group "root"
  action :create
end

remote_file "/etc/init.d/jmxtrans" do
  source "https://raw.github.com/Stackdriver/jmxtrans-config-stackdriver/master/jmxtrans/example-run-script/jmxtrans"
  owner "root"
  group "root"
  mode 00755
  action :create
end

service "jmxtrans" do
  action :restart
end
