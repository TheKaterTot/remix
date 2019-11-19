require_relative './loader'
require_relative './remix'
require_relative './writer'
require 'slop'

#!/usr/bin/env ruby
opts = Slop.parse do |o|
    o.string '-h', '--host', 'a hostname', default: 'http://localhost:9999'
    o.string '-o', '--org', 'an organization'
    o.string '-b', '--bucket', 'a bucket'
    o.string '-t', '--token', 'a token', default: ENV["INFLUX_TOKEN"]
end

load = Loader.new(ARGV.last)
load.update_time

writer = Writer.new(opts[:host], opts[:org], opts[:bucket], opts[:token])
writer.write(load.blob)
