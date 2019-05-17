#!/usr/bin/env ruby

#require 'net/http'
#require 'uri'
#require 'json'
require 'YAML'

=begin

usage :

testit.rb /full/path/to/variable.yml local

Example of variables File

server:
  prod:
    url:
    key:
    secret:
    payload:
      appID:
      userID:
  local:
    url:
    key:
    secret:
    payload:
      appID:
      userID:

payload:
  operationName:
  query: /full/path/to/query.graphql
  schemaHandle:
  versionHandle:
  variables:
    id: "gid://shopify/DiscountCodeNode/1",
    discount:
      title: asdf
      startsAt: "2021-05-06T13:20:03Z",
      endsAt: "2022-05-06T13:20:03Z",


TODO:
- parse yaml File
- validate that the server name is in the variables
- convert payload to ruby object
- merge server payload variables
- read the graphql File
- support inline graphql
- print the query
- print the response

=end




#uri = URI.parse("https://api.example.com/surprise")
#request = Net::HTTP::Post.new(uri)
#request.basic_auth("banana", "coconuts")
#request.content_type = "application/json"
#request.body = JSON.dump({
#  "array" => [
#    1,
#    2,
#    3
#  ],
#  "object" => {
#    "foo" => "bar",
#    "nested" => {
#      "baz" => true
#    }
#  }
#})
#
#req_options = {
#  use_ssl: uri.scheme == "https",
#}
#
#response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#  http.request(request)
#end
#
## response.code
## response.body
