require_dependency '../../lib/template_renderer'
require_dependency '../../lib/mailgun'

class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  layout "admin", except: [ :new, :create ]

  def index
    @user = current_user
  end

  def new
    @user = User.new
    @courses = Course.all.order(:day)
  end

  def create
    user = user_params
    user[:courses].map! { |name| Course.find_by(name: name) }

    @user = User.new(user)
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_inscription_path, notice: 'Inscrição realizada com sucesso.' }
        format.json { render :show, status: :created, location: @user }
        html = TemplateRenderer.render("#{Rails.root}/lib/mail_views/inscricao.html.erb", person: @user.as_json(:include => :courses))
        MailGun.send_mail(@user.email, "Inscrição realizada com sucesso!", html)
      else
        p "error"
        puts @user.errors
        @courses = Course.all.order(:day)
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :accomodation, :cpf, :shirt,
     :address, :university, :course, :payment_preference, :phone, :courses => [])
  end
end
