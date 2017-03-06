# Arma3Caller

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/arma3_caller`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arma3_caller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arma3_caller

## Usage

Commands : 
> Get server basic informations


    serverInfosArray = myServer.server_info 
> puts serverInfosArray => `{:header=>"I", :protocol_version=>17, :server_name=>"[RU] teste Altis Life |www.genp.ru| +Addons", :server_map=>"Altis", :server_game=>"Arma3", :server_description=>"Altis Life RPG ", :server_api=>0, :players_connected=>77, :max_players=>150, :bots_ingam
                            e=>0, :server_type=>"d", :server_environment=>"w", :server_visibility=>0, :server_vac=>0, :server_version=>"1.66.139586"}
`



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/arma3_caller. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

