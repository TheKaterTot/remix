require 'faraday'

class Writer
    def initialize(org, bucket, token)
        @url = "https://us-west-2-1.aws.cloud2.influxdata.com"
        @org = org
        @bucket = bucket
        @token = token
    end

    def write
        conn = Faraday.new(
            url: @url, 
            params: {org: @org, bucket: @bucket}, 
            headers: {"Authorization" => "Token #{@token}"}
        )
        res = conn.post('api/v2/write') do |req|
            req.body = 'test,host=host1 used_percent=23.43234543 1573682530669955015'
        end
    end
end