class UserMailer < ActionMailer::Base
  default :from => "spencer.kline@gmail.com"
  def welcome_email(user)
      @user = user
      @url  = "http://sportscape.herokuapp.com/"
      mail(:to => user.email,
           :subject => "Welcome to SportScape")
  end
end