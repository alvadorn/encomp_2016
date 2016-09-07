require_dependency '../../lib/template_renderer'
require_dependency '../../lib/mailgun'

class MailerController < AdminController
  before_action :authenticate_user!
  before_action :permission!
  before_action :set_user

  layout "admin"

  # GET /
  def index

  end

  private

  def set_user
    @user = current_user
  end

  def query_email
    query = "(admin = false and auxiliar = false)"
    if params[:everyone] != true
      if params[:paid]
        query += " and (paid = true)"
      else
        query += " and (paid = false)"
      end

      if params[:minicourses].size > 0
        query += "and ("
        or_ = false
        if params[:ruby_on_rails]
          query += "user.id"
          or_ = true
        end

        query += ")"
      end

    end
    query
  end

end
