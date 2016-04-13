#!/usr/bin/env ruby
require 'socket'

hostname = Socket.gethostname
hostname_as_seed = hostname.each_byte.map(&:to_i).join("").to_i

color = Random.new(hostname_as_seed).rand(256).to_s
color = "0" + color if color.length == 2

puts color

