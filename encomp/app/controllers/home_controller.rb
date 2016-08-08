class HomeController < ApplicationController
  before_filter :authenticate_user!, only: :admin_index
  
  def index
  end

  def admin_index
  end
end
