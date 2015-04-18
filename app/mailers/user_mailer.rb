class UserMailer < ActionMailer::Base
  default from: "newstab123@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://http://thawing-brook-1019.herokuapp.com/profile/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
