require 'faraday'

module InfluxRemix
    class Writer
        def initialize(host, org, bucket, token)
            @url = host
            @org = org
            @bucket = bucket
            @token = token
        end
    
        def write(data)
            stringData = data.reduce("") do |blob, line|
                blob + line.line_protocol + "\n"
            end
            conn = Faraday.new(
                url: @url, 
                params: {org: @org, bucket: @bucket}, 
                headers: {"Authorization" => "Token #{@token}"}
            )
            res = conn.post('api/v2/write') do |req|
                req.body = stringData.chomp
            end
        end
    end 
end