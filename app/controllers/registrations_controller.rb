class RegistrationsController < Devise::RegistrationsController

  #copied code from devise github, registrations#update to add flash message on successful update
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      flash[:notice] = "Profile updated" # my contribution
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected
  #after user update redirect to user's show page
  def after_update_path_for(resource)
    "/users/#{resource.id}"
  end
end