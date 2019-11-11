class Remix
    def initialize(data)
        @data = data
    end

    def measurement
        elements = @data.split(',')
        if has_measurement?
            return elements.first
        else 
            return nil
        end
    end

    def tags
        elements = @data.split(' ')
        chunk = elements.first.split(',')
        if has_measurement?
            chunk.shift
        end
        transform_data(chunk) 
    end

    def fields
        elements = @data.split(' ') 
        chunk = elements[1].split(',')
        transform_data(chunk) 
    end

    def time
        @data.split(' ').last
    end

    def update_time(time)
        info = @data.split(' ')
        info.pop
        info.push(time.to_s)
        @data = info.join(' ')
    end

    private

    def has_measurement?
        elements = @data.split(',')
        !elements.first.include?('=')
    end

    def transform_data(chunk)
        chunk.reduce({}) do |memo, val|
            elements = val.split('=')
            if !memo.has_key?(elements[0])
                memo[elements[0]] = []
            end
            memo[elements[0]].push(elements[1])
            memo
        end
    end
end
  