class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    admin_index_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      "try_login"
    else
      "application"
    end
  end
end
