require 'square'
require 'dot_env'

class SquareController < ApplicationController

  current_environment = DotEnv.get_environment
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

      if access_token
        # Store the access token securely for the retailer
        # Associate it with the retailer's account or user
        current_retailer.update(square_access_token: ENV['SQUARE-ACCESS-TOKEN'])

        flash[:success] = "Square account linked successfully!"
        redirect_to '/dashboard' # or any other desired page
      else
        flash[:error] = "Failed to link Square account. Please try again."
        redirect_to retailer_signup_path # or any other desired page
      end
    else
      flash[:error] = "Failed to receive authorization code from Square. Please try again."
      redirect_to retailer_signup_path # or any other desired page
    end
  end
end
