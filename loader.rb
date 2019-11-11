require_relative './remix'
require 'time'

class Loader
    def initialize(file)
        @file = file
        @blob = []
        parse
    end

    def blob
        @blob
    end

    def update_time
        now = time_nsec
        diff = now.to_i - (blob[0].time).to_i
        @blob.each do |remix|
            remix.update_time((remix.time).to_i + diff)
        end
    end

    private
    def parse
        File.open(@file).each do |line|
            @blob.push(Remix.new(line))
        end
    end

    def time_nsec 
        now = "%10.9f" % Time.now.to_f
        now.delete!('.')
    end
end