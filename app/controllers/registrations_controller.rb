class RegistrationsController < Devise::RegistrationsController
  protected
  #after user update redirect to user's show page
  def after_update_path_for(resource)
    "/users/#{resource.id}"
  end
end