require "square"
require 'dot_env'

module SquareService

    current_environment = DotEnv.get_environment

    def square_authorization_url
        client = Square::Client.new(
          access_token: ENV['SQUARE-ACCESS-TOKEN'],
          environment: 'sandbox' # or 'production' depending on your setup
        )
    
        client.oauth.authorize_url(
          client_id: ENV['SQUARE-APPLICATION-ID'],
          redirect_uri: square_callback_url,
          state: 'optional_state'
        )
      end
    
      def exchange_authorization_code(code)
        client = Square::Client.new(
          access_token: ENV['SQUARE-ACCESS-TOKEN'],
          environment: 'sandbox' # or 'production' depending on your setup
        )
    
        client.oauth.obtain_token(
          client_id: ENV['SQUARE-APPLICATION-ID'],
          client_secret: ENV['SQUARE-SECRET'], 
          code: code
        ).access_token
      end
end
  