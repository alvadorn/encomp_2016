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

  # POST /enviar
  def send_mail
    paid = params[:paid] == "on" ? true : false
    not_paid = params[:not_paid] == "on" ? true : false
    title = params[:email_title]
    body = params[:email_body]
    query = query_email(paid, not_paid)
    emails = []
    User.where(query).select(:email).each { |u| emails << u.email }
    puts emails
    html = TemplateRenderer.render("#{Rails.root}/lib/mail_views/email.html.erb", body: { body: body, title: title })
    MailGun.send_mail("nao-responda@encomp.com.br", title, html, "", ["igorba2005@gmail.com", "jirachi.guardian@gmail.com"])
    redirect_to mail_index_path
  end

  private

  def set_user
    @user = current_user
  end

  def query_email(paid, not_paid)
    query = "(admin = false and auxiliar = false)"
    if paid == not_paid
      return query
    else
      query += " and paid = true" if paid
      query += " and paid = false" if paid
    end
    query
  end

end
