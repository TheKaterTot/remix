# InfluxRemix

![Image of DJ Giraffe](https://user-images.githubusercontent.com/1721599/69569749-2420b380-0f73-11ea-95cb-cf524a3032a8.PNG)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'influx_remix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install influx_remix

# What you Need
You need a text file in line protocol format. 

Remix is a Ruby gem, so you need Ruby in order to run it. #sorrynotsorry

## How does it work?

The first data point in your file will become "now". All other points will be reassigned in relation to now. Two points that are five seconds apart will remain five seconds apart, just at a fresher point in time. Only the timestamp changes--nothing else about your data will be changed.

## Usage

    $ influx_remix -org "myOrg" -bucket "lilbucket" mylineprotocol.txt

    $ influx_remix -o "MyOrg" -b "lilbucket" -t "secrettoken" mylineprotocol.txt

    $ influx_remix -o "MyOrg" -b "lilbucket" -h "http://localhost:9999" -t "secrettoken" mylineprotocol.txt


# Defaults
The default host is http://localhost:9999
If you're using InfluxDB Cloud 2.0, simply add the host flag with the url to your instance.

The default token is $INFLUX_TOKEN, but you can specify the token with the token flag.

# Flags

--host, -h: host url of your InfluxDB 2.0 instance

--org, -o: name of your InfluxDB organization

--bucket, -b: name of the InfluxDB bucket to write to

--token, -t: your InfluxDB 2.0 token

You can always use the help flag to see the available options.

    $ influx_remix --help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/remix.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
