#!/usr/bin/env ruby
require 'net/ping'

up = true
host = Net::Ping::External.new('google.com')
down_at = nil

puts "Running..."
loop do
  if host.ping
    if !up
      up = true
      duration = Time.at(Time.now - down_at).gmtime
      print Time.now.to_s + " (lasted " + duration.strftime('%R:%S') + ")\n"
    end
  else
    if up
      down_at = Time.now
      print "Down from " + down_at.to_s + " until... "
      up = false
    end
  end
  sleep(1)
end