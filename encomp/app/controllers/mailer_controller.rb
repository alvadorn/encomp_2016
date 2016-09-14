class ReportsController < AdminController
  before_action :authenticate_user!
  before_action :permission!
  before_action :set_user
  layout "admin"

  # GET
  def index
  end

  # POST
  def send_email
    title = params[:title]
    body = params[:body]
    SubscribeMailer.custom_email(User.find(1), title, body)
  end

  private
  def set_user
    @user = current_user
  end
end
