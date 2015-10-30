#!/usr/bin/env puma

# this is just for development, capistrano-puma generates a different puma.rb on deploy
# see: https://github.com/CodeClub/engineering/wiki/Apps:-Puma

# for all config options, see: https://github.com/puma/puma/blob/master/examples/config.rb

# default is "development"
environment "development"

# default is "tcp://0.0.0.0:9292"
# when using port 80, `sudo` is required in order to bind (see Procfile)
bind 'tcp://0.0.0.0:80'

# configure min & max threads
# default is "0, 16"
# threads 0, 16

# should generally be equal to the number of processors available
# cluster mode requires >= 2
# default is 0
workers 1

# default is 60
worker_timeout 30

# preload the application before starting the workers; this conflicts with phased restart feature
# comment to turn off, default is off
preload_app!
