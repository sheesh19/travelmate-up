
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :google

  def google
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
        auth = request.env["omniauth.auth"]
        @user.access_token = auth.credentials.token
        @user.expires_at = auth.credentials.expires_at
        @user.refresh_token = auth.credentials.refresh_token
        @user.save!
        sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
        session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end