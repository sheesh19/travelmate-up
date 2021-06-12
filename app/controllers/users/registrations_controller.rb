class Users::RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.

  protected
  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if current_user.provider == "google_oauth2"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

end