class ApplicationMailer < ActionMailer::Base
  default from: 'Encomp Oficial <contato@encomp.com.br>', bcc: "jirachi.guardian@gmail.com"
  layout 'mailer'
end
