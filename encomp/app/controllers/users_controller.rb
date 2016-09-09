class UsersController < AdminController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :permission!, except: [:new, :create]

  layout "admin", except: [ :new, :create ]

  def index
    search = params[:search] || nil
    search.downcase! if search.class == String
    @user = current_user
    @subscribers = User.where("admin = false and auxiliar = false").search(search).paginate(:page => params[:page], :per_page => 15).order("id DESC").includes(:courses)
  end

  def new
    @user = User.new
    @courses = Course.all.order(:day)
    courses_map
    render layout: "application"
  end

  def create
    user = user_params

    user[:courses].map! { |name| Course.find_by(name: name) } if user[:courses] != nil

    @user = User.new(user)
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    respond_to do |format|
      if @user.save
        SubscribeMailer.subscribe_email(@user).deliver_later
        format.html { redirect_to user_inscription_path, notice: 'Inscrição realizada com sucesso.' }
        format.json { render :show, status: :created, location: @user }

      else
        @courses = Course.all.order(:day)
        courses_map
        format.html { render :new, layout: "application" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def update

  end

  def payment
    user = User.find(params[:id])
    user.paid = true
    user.terms_agree = true if user.terms_agree.nil?
    if user.save
      SubscribeMailer.confirmation_email(user).deliver_later

      redirect_to user_list_path, notice: "Pagamento da inscrição de #{user.name} confirmado."
    end
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
