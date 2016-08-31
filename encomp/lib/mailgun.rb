require 'faraday'

module MailGun
  FROM = "Encomp Oficial <contato@encomp.com.br>"
  URL = "https://api.mailgun.net/v3/encomp.com.br/messages"

  def send_mail(dest, subject, html, text = "")
    conn = Faraday.new('https://api.mailgun.net/v3') do |faraday|
      #faraday.request  :multipart
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    message_params = {
      :from => FROM,
      :to => dest,
      :subject => subject,
      :html => html,
      :text => text
    }
    conn.basic_auth('api', 'key-a2e7f8ae6f91ec6f8d594f14cc9198e1')
    conn.post('encomp.com.br/messages', message_params)

  end



  module_function :send_mail
end

#MailGun.send_mail(["igorba2005@gmail.com", "contato@igorsantana.com"], "nada2", "<html>huehuehue2</html>", "Lol2")
