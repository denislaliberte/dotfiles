#!/usr/bin/env ruby
require 'erb'
require 'Date'

priority = ARGV.join(' ')
week = Time.now.strftime('%W, %B')
even_week = Time.now.strftime('%W').to_i.even?
path = "#{ENV['HOME']}/template/week.md.erb"

file = File.read(path)
template = ERB.new(file)
puts template.result(binding)
