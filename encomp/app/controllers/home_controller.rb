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
    @courses = Course.all
    @no_accomodation = User.where("accomodation = 'Não necessário'").count
    @male = User.where("accomodation = 'Masculino'").count
    @female = User.where("accomodation = 'Feminino'").count
    @mixed = User.where("accomodation = 'Misto'").count
    render layout: "admin"
  end

  private
  def set_user
    @user = current_user
  end


end
