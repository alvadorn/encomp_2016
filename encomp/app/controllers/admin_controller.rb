class AdminController < ApplicationController

  protected
  def permission!
    unless (current_user.admin? || current_user.auxiliar?)
      sign_out current_user

      redirect_to root_path
    end
  end

end
