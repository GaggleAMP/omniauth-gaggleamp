# OmniAuth GaggleAMP OAuth2 Strategy

A GaggleAMP OAuth2 strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-gaggleamp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-gaggleamp

## Usage

Register your application with GaggleAMP to receive an API key.

This is an example that you might put into a Rails initializer at `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gaggleamp, ENV['GAGGLEAMP_KEY'], ENV['GAGGLEAMP_SECRET']
end
```

You can now access the OmniAuth GaggleAMP OAuth2 URL: `/auth/gaggleamp`.
