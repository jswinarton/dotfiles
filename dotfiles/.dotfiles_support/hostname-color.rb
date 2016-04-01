#!/usr/bin/env ruby
require 'socket'

hostname = Socket.gethostname
hostname_as_seed = hostname.each_byte.map(&:to_i).join("").to_i

puts Random.new(hostname_as_seed).rand(256)

