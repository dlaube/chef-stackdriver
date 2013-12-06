#
# Cookbook Name:: stackdriver
# Attributes:: default
#
#

default['stackdriver']['api']['key'] = "YOUR_API_KEY_HERE"
default['stackdriver']['collectd']['config'] = "yes"

# supported plugins: ['elasticsearch', 'nginx', 'mongodb', 'rabbitmq']
default['stackdriver']['plugins']['active'] = []

default['stackdriver']['plugins']['elasticsearch']['requires'] = ['yajl']

default['stackdriver']['plugins']['mongodb']['allow_secondary_query'] = false
default['stackdriver']['plugins']['mongodb']['port'] = 27017
default['stackdriver']['plugins']['mongodb']['requires'] = []

default['stackdriver']['plugins']['nginx']['requires'] = []

default['stackdriver']['plugins']['rabbitmq']['auth']['user'] = 'guest'
default['stackdriver']['plugins']['rabbitmq']['auth']['pass'] = 'guest'
default['stackdriver']['plugins']['rabbitmq']['port'] = 15672 # 5672
default['stackdriver']['plugins']['rabbitmq']['requires'] = ['yajl']
default['stackdriver']['plugins']['rabbitmq']['vhosts'] = [
  {
    'name' => '%2F',
    'queues' => [
      'queue_name',
    ],
  },
]
