# RoutechApi Ruby Library

The RoutechApi Ruby library provides a convenient access to the Routech API from
applications written in the Ruby language.

The library also provides other features. For example:

- Easy configuration path for fast setup and use.

## Documentation

See the full Api Doc [Routech Api Doc](https://routech.stoplight.io/docs/routech/YXBpOjExNjk4MzI5-routech-manual-de-api)


## Installation

You don't need this source code unless you want to modify the gem. If you just
want to use the package, just run:

```sh
gem install routech-api
```

In your terminal, run the code below inside your project to create config file of gem

```sh
rails g routech_api:install
```

### Requirements

- Ruby 2.3+.

### Bundler

If you are installing via bundler, you should be sure to use the https rubygems
source in your Gemfile, as any gems fetched over http could potentially be
compromised in transit and alter the code of gems fetched securely over https:

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'routech_api', git: 'git://github.com/NeoFleet/routech_api.git'

```

## Usage

The library needs to be configured with url: `Routech server url`, api_key: `base64 of username:password for auth basic`, log_level: `level of log warnings`, ssl: `boolean value for use or not SSL`

```ruby
RoutechApi.config do |config|
  config.url = "routech_server_url"
  config.api_key = 'api_key'
  config.log_level = 'debug'
  config.ssl = false
  end
```
