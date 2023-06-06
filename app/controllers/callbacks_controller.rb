class CallbacksController < Devise::OmniauthCallbacksController
    def square
        @user = User.from_omniauth(request.env['omniauth.auth'])
        sign_in_and_redirect @user
        # if @user.persisted?
        #      sign_in_and_redirect @user
        #      set_flash_message(:notice, :success, kind: 'Square') if is_navigational_format?
        # else
        #      flash[:error]='There was a problem signing you in through Square. Please register or try signing in later.'
        #      redirect_to new_user_registration_url
        # end
     end
end