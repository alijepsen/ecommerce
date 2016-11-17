class SignupMailer < ApplicationMailer

  default from: ENV['MAIL_FROM']

  def new_signup(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Welcome to T-shirt Town, Partner')
  end
end
