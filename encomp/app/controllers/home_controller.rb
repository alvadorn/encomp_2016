class HomeController < AdminController
  before_action :authenticate_user!, only: :admin_index
  before_action :permission!, only: :admin_index

  def index
  end

  def admin_index
    render layout: "admin"
  end

end
