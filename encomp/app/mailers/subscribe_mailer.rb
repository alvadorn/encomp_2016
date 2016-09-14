class SubscribeMailer < ApplicationMailer

  def subscribe_email(user)
    @user = user
    mail(to: @user.email, subject: "Inscrição realizada com sucesso!")
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: "Inscrição confirmada com sucesso!")
  end

  def custom_email(user, title, body)
    @user = user
    @body = body
    @title = title
    mail(to: @user.email, subject: @title)
  end

  def test_email(mail)
    mail(to: mail, subject: "test mail")
  end
end
