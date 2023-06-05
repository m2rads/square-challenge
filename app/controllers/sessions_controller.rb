class SessionsController < ApplicationController
    def new
        render :new
    end
    
    def create
        user_info = request.env['omniauth.auth']
        raise user_info
        # render json: { user_info: user_info }
    end
end
  