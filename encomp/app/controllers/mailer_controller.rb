class MailerController < AdminController
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
    count = 0
    @users = User.where(admin: false).where(auxiliar: false)


    @users.each do |user|
      SubscribeMailer.custom_email(user, title, body).deliver_later(wait: (count % 12).seconds)
      count += 1
    end
    
    redirect_to mailer_index_path, notice: 'Emails enviados com sucesso.'
  end

  private
  def set_user
    @user = current_user
  end
end
