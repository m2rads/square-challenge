class CallbacksController < Devise::OmniauthCallbacksController
  def square
    @user = User.from_omniauth(request.env['omniauth.auth'])
    @retailer = Retailer.from_omniauth(request.env['omniauth.auth'], @user)
    sign_in_and_redirect @user

  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end
end
