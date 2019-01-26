#!/usr/bin/env ruby
require 'erb'

class_name = ARGV[0].nil? ? 'asdf' : ARGV[0]
method_name = ARGV[1].nil? ? class_name : ARGV[1]

template = ERB.new <<-EOF

class <%= class_name.capitalize %>
  def method_<%= method_name %>
  end
end
EOF

puts template.result(binding)
