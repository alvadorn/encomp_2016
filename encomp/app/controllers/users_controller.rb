class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  layout "admin", except: [ :new, :create ]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    respond_to do |format|
      if @user.save
        p "no error"
        format.html { redirect_to user_inscription_path, notice: 'Inscrição realizada com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        p "error"
        puts @user.errors
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
    params.require(:user).permit(:name, :email, :accomodation, :courses, :cpf, :shirt,
     :address, :university, :course, :payment_preference)
  end
end
