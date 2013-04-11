# Sample app for GaggleAMP Strategy
# Make sure to setup the ENV variables GAGGLEAMP_KEY and GAGGLEAMP_SECRET
# Run with "bundle exec rackup"

require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-gaggleamp'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/gaggleamp'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'change_me'

use OmniAuth::Builder do
  provider :gaggleamp, ENV['GAGGLEAMP_KEY'], ENV['GAGGLEAMP_SECRET']
end

run App.new
