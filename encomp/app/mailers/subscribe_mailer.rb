class SubscribeMailer < ApplicationMailer

  def subscribe_email(user)
    @user = user
    mail(to: @user.email, subject: "Inscrição realizada com sucesso!")
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: "Inscrição confirmada com sucesso!")
  end

  def test_email(mail)
    mail(to: mail, subject: "test mail")
  end
end
