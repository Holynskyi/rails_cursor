class AccountMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.name, subject: 'Welcome to My Awesome Site')
  end

end
