#!/usr/bin/env ruby
require 'erb'

test_name = ARGV[0]
name = test_name.capitalize

template = ERB.new <<-EOF
require 'minitest/autorun'

class <%= name %>Test < Minitest::Test
  def test_<%= test_name %>
    assert false
  end
end
EOF

puts template.result(binding)
