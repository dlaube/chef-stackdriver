#
# Cookbook Name:: stackdriver
# Attributes:: default
#
#

default['stackdriver']['api']['key'] = "YOUR_API_KEY_HERE"
default['stackdriver']['collectd']['config'] = "yes"

# supported plugins: ['elasticsearch', 'nginx', 'mongodb']
default['stackdriver']['plugins']['active'] = []

default['stackdriver']['plugins']['elasticsearch']['requires'] = ['yajl']
default['stackdriver']['plugins']['nginx']['requires'] = []
default['stackdriver']['plugins']['mongodb']['requires'] = []
default['stackdriver']['plugins']['mongodb']['port'] = 27017
default['stackdriver']['plugins']['mongodb']['allow_secondary_query'] = false
