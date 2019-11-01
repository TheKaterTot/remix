require_relative './remix'

class Loader
    def initialize(file)
        @file = file
        @blob = []
        parse
    end

    def blob
        @blob
    end

    private
    def parse
        File.open(@file).each do |line|
            @blob.push(Remix.new(line))
        end
    end
end