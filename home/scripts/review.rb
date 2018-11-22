#!/usr/bin/env ruby
require 'erb'

title = ARGV[0].nil? ? '_branch_' : ARGV[0]
id = ARGV[1].nil? ? '_id_' : ARGV[1]
path = "#{ENV['HOME']}/template/review.md.erb"

file = File.read(path)
template = ERB.new(file)
puts template.result(binding)
