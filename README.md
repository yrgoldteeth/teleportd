# Teleportd

Ruby Wrapper Library for [Teleportd](http://teleportd.com)
[API](http://teleportd.com/api)

Currently, this wrapper only supports the basic search functionality.

## Installation

Add this line to your application's Gemfile:

    gem 'teleportd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teleportd

## Usage

NOTE: You must set an ENV variable 'TELEPORTD_API_KEY' for your Teleportd API key

    $ export TELEPORTD_API_KEY=$APIKEY

Create an instance of a Teleportd::Search with optional filters.  Call
the result method on the Search instance to receive a Hash of the
search.

Basic Query Without Filters:

    $ search = Teleportd::Search.new

Query With Locations:

    $ options = {}
    $ options[:location] = {}
    $ options[:location][:latitude] = 34.19
    $ options[:location][:longitude] = -119.49
    $ options[:location][:vertical] = 5.0
    $ options[:location][:horizontal] = 5.0
    $ search = Teleportd::Search.new(options)

Query With Textual Search:

    $ options = {}
    $ options[:textual_search] = 'foo bar baz'
    $ search = Teleportd::Search.new(options)

Query With Time Period (start/end)
    
    $ options = {}
    $ options[:time_period] = {}
    $ options[:time_period][:start_time] = 5.days.ago
    $ options[:time_period][:end_time] = 2.days.ago
    $ search = Teleportd::Search.new(options)

Query With Sort (relevance/recency)
    
    $ options = {}
    $ options[:sort] = 'relevance'
    $ search = Teleportd::Search.new(options)

Options can be combined, of course:
    
    $ options = {}
    $ options[:location] = {}
    $ options[:location][:latitude] = 34.19
    $ options[:location][:longitude] = -119.49
    $ options[:location][:vertical] = 5.0
    $ options[:location][:horizontal] = 5.0
    $ options[:time_period] = {}
    $ options[:time_period][:start_time] = 5.days.ago
    $ options[:time_period][:end_time] = 2.days.ago
    $ options[:textual_search] = 'foo bar baz'
    $ search = Teleportd::Search.new(options)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
