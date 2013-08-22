#
# Cookbook Name:: stackdriver
# Attributes:: default
#
#

default['stackdriver']['api']['key'] = "YOUR_API_KEY_HERE"
default['stackdriver']['collectd']['config'] = "yes"

case node[:platform]
when 'amazon'
  default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/stackdriver-amazonlinux.repo'
when 'redhat', 'centos'
  default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/stackdriver.repo'

when 'ubuntu'
  case node[:platform_version]
    when '12.04', '12.10'
      default[:stackdriver][:repo_url] = 'deb http://repo.stackdriver.com/apt precise main'
    when '10.04'
      default[:stackdriver][:repo_url] = 'deb http://repo.stackdriver.com/apt lucid main'
    else
      default[:stackdriver][:repo_url] = 'deb http://repo.stackdriver.com/apt precise main'
  end

end