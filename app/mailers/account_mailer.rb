class AccountMailer < ApplicationMailer

  def welcome_email(account)
    @account = account
    @url  = 'http://example.com/login'
    mail(to: @account.name, subject: 'Welcome to My Awesome Site')
  end

end
