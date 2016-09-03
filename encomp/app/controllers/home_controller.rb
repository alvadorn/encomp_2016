class HomeController < AdminController
  before_action :authenticate_user!, only: :admin_index
  before_action :set_user, only: :admin_index
  before_action :permission!, only: :admin_index

  def index
  end

  def admin_index
    #@user = current_user
    @inscripted_paid = User.where("admin = false and paid = true").count
    @inscripted_count = User.where("admin = false and paid = false").count
    @courses = Course.select(:name).all
    render layout: "admin"
  end

  private
  def set_user
    @user = current_user
  end

end
