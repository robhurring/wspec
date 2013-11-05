# Wspec

This gem acts like guard-rspec, but for a single rspec command. Instead of monitoring an entire folder and re-running large chunks of your test suite, this can be used instead of your normal `rspec` command, with the added bonus that once one of the files is modified, it re-runs that `rspec` command.

## Disclaimer

This is a proof of concept. I wanted something that behaved like guard, but for individual files. This allows me to have a guard-like experience when I really only care about a single spec file I'm working on.

## Installation

Add this line to your application's Gemfile:

    gem 'wspec'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wspec

## Usage

Use like you would use the `rspec` command. All command line options are parsed via `rspec` so they "should" work.


A simple example would be to monitor the `spec/models/user_spec.rb` file, and when it is modified it will re-run the `rspec spec/models/user_spec.rb` command

```sh
wspec spec/models/user_spec.rb
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
