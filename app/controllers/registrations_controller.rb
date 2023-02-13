class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    "/users/#{resource.id}"
  end
end