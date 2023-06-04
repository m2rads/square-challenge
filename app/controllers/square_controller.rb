class SquareController < ApplicationController
  include SquareService 

    def link_account
      # Redirect the retailer to Square's OAuth authorization URL
      redirect_to square_authorization_url
    end
  
    def callback
      # Handle the callback from Square's OAuth authorization process
      if params[:code]
        # Exchange the authorization code for an access token
        access_token = exchange_authorization_code(params[:code])
  
        # Store the access token securely for the retailer
        # Associate it with the retailer's account or user
        current_retailer.update(square_access_token: access_token)
  
        flash[:success] = "Square account linked successfully!"
        redirect_to retailer_dashboard_path # or any other desired page
      else
        flash[:error] = "Failed to link Square account. Please try again."
        redirect_to retailer_signup_path # or any other desired page
      end
    end
  
    private
  
    def authorization_url
      client = Square::OAuth::Client.new
      client.authorization_url(
        client_id: Rails.application.config.square.client_id,
        redirect_uri: square_callback_url
        # Add any required scopes or additional parameters
      )
    end
  
    def exchange_authorization_code(code)
      client = Square::OAuth::Client.new
      client.obtain_token_by_authorization_code(
        client_id: Rails.application.config.square.client_id,
        client_secret: Rails.application.config.square.client_secret,
        code: code
      ).access_token
    end
  end
  