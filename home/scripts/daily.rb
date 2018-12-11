#!/usr/bin/env ruby
require 'erb'
require 'Date'

priority = ARGV.join(' ')

def day
  Time.now.strftime('%A')
end

def even_week?
  Time.now.strftime('%W').to_i.even?
end

def monday?
  day == 'Monday'
end

def tuesday?
  day == 'Tuesday'
end

def wednesday?
  day == 'Wednesday'
end

def thursday?
  day == 'Thursday'
end

def friday?
  day == 'Friday'
end

def even_week?
  Time.now.strftime('%W').to_i.even?
end

date = Time.now.strftime('%d')
path = "#{ENV['HOME']}/template/daily.md.erb"

file = File.read(path)
template = ERB.new(file)
puts template.result(binding)
