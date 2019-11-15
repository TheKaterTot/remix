require 'faraday'

class Writer
    def initialize(org, bucket, token)
        @url = "https://us-west-2-1.aws.cloud2.influxdata.com"
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
            req.body = stringData.strip
        end
    end
end