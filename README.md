# Remix

Welcome to Remix, a command line tool to import historical data into InfluxDB 2.0 with current timestamps. 

## What you need

You need a text file in line protocol format. 

Remix is written in Ruby, so you need Ruby in order to run it. #sorrynotsorry

## How does it work?

The first data point in your file will become "now". All other points will be reassigned in relation to now. Two points that are five seconds apart will remain five seconds apart, just at a fresher point in time. Only the timestamp changes--nothing else about your data will be changed.

## Usage

Clone this repo.

Don't forget to bundle!

If you're adding this to an open source instance of InfluxDB 2.0, make sure Influx is running before you run the following command.

From the project directory:
    $ruby ./main.rb -o "MyOrg" -b "lilbucket" -t "secrettoken" mylineprotocol.txt

The default host is http://localhost:9999
If you're using InfluxDB Cloud 2.0, simply add the host flag with the url to your instance.

The default token is $INFLUX_TOKEN, but you can specify the token with the token flag.

# Flags

--host, -h: host url of your InfluxDB 2.0 instance
--org, -o: name of your InfluxDB organization
--bucket, -b: name of the InfluxDB bucket to write to
--token, -t: your InfluxDB 2.0 token
