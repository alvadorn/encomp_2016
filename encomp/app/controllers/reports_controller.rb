class ReportsController < AdminController
  before_action :authenticate_user!
  before_action :permission!
  before_action :set_user
  layout "admin"

  # GET /admin/relatorios
  def index
  end

  # GET /admin/relatorios/:type
  def show
    @type = params[:type]
    list_all @type
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :show, filename: "#{@type}-encomp-2016" }
    end
  end

  # GET /admin/relatorios/camisas
  def show_shirts
    @sizes = User.select(:shirt).distinct
    @users = User.where(admin: false).where(auxiliar: false)

    @sizes_paid = User.select(:shirt).where(paid: true).distinct
    @users_paid = @users.where(paid: true)
  end


  def venda
    @data = User.where("admin = false and auxiliar = false").order(:name)
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :venda, filename: "dados-encomp-2016" }
    end
  end

  private
  def set_user
    @user = current_user
  end

  def list_all(type)
    @subs = nil
    @subs_not_paid = nil
    @subs_paid = nil
    if type == "inscritos"
      @subs = User.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "ror"
      @subs = Course.find_by(name: "Ruby On Rails").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "git"
      @subs = Course.find_by(name: "Git").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "visita"
      @subs = Course.find_by(name: "Visita técnica").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "linux"
      @subs = Course.find_by(name: "Linux").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "machine_learning"
      @subs = Course.find_by(name: "Aprendizado de Máquina").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "robotica"
      @subs = Course.find_by(name: "Robótica").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    elsif type == "torneio"
      @subs = Course.find_by(name: "Torneio de Programação").users.where("admin = false and auxiliar = false").order(:name)
      @subs_not_paid = @subs.where(paid: false)
      @subs_paid = @subs.where(paid: true)
    else
      raise ActionController::RoutingError.new('Not Found')
    end

  end
end
