require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Authentication strategy for connecting with GaggleAMP using
    # the [OAuth 2.0 Specification](http://tools.ietf.org/html/draft-ietf-oauth-v2-10).
    # You must generally register your application with GaggleAMP and
    # utilize a client id and secret in order to authenticate using
    # OAuth 2.0.
    class GaggleAMP < OmniAuth::Strategies::OAuth2
      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => 'https://accounts.gaggleamp.com'
      }

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
          :nickname => raw_info['nickname']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'gaggleamp', 'GaggleAMP'
