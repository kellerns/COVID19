# COVID19

Welcome to the COVID19 gem. This gem will allow the user to access up-to-date statistics about the 2020 coronavirus pandemic.

The user will be given a menu with options and suggestions to help them get started.
Worldwide statistics are given through the default commands, but the user has the option to search country-specific statistics as well.

If the option for a country was chosen, the user will encounter a similar menu to the one they were presented with earlier, but will now be able to access statistics per country.
The user will also be able to return to the main menu and search for different countries without having to restart the program.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'COVID19'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install COVID19

## Usage

Run the gem and you will be given a menu and prompted to give the program the information that you are looking for.

The default options given will allow you to access worldwide statistics, while the 'country' option will provide the user with the ability to search statistics for an individual country.

For choosing certain countries, certain verbiage must be used and is listed below in the format of 'country : input' (Country input is case-sensitive):

United States : 'USA'
United Kingdom : 'UK'
South Korea : 'S. Korea'
United Arab Emirates : 'UAE'
Democratic Republic of the Congo : 'DRC'
Central African Republic : 'CAR'

Failing to type a valid country will result in a message that will direct the user to the README.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'reliable-flag-4556'/COVID19. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the COVID19 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'reliable-flag-4556'/COVID19/blob/master/CODE_OF_CONDUCT.md).
