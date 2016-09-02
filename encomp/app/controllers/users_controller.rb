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
    courses_map
  end

  def create
    user = user_params

    user[:courses].map! { |name| Course.find_by(name: name) } if user[:courses] != nil

    @user = User.new(user)
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_inscription_path, notice: 'Inscrição realizada com sucesso.' }
        format.json { render :show, status: :created, location: @user }
        value_to_pay = 25
        @user.courses.each { |k| value_to_pay += k.value }
        person = @user.as_json(:include => :courses)
        person["value_to_pay"] = value_to_pay
        html = TemplateRenderer.render("#{Rails.root}/lib/mail_views/inscricao.html.erb", person: person)
        MailGun.send_mail(@user.email, "Inscrição realizada com sucesso!", html)
      else
        @courses = Course.all.order(:day)
        courses_map
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
     :address, :university, :course, :payment_preference, :phone, :team_name, :terms_agree, :courses => [])
  end

  def courses_map
    @courses.map do |c|
      c.vancancies_left = (c.vacancies - c.users.count)
    end
  end
end
