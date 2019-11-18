require_relative './loader'
require_relative './remix'
require_relative './writer'

#!/usr/bin/env ruby
load = Loader.new(ARGV[3])
load.update_time

writer = Writer.new(ARGV[0], ARGV[1], ARGV[2])
writer.write(load.blob)
