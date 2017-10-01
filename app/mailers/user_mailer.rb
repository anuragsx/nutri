class UserMailer < ApplicationMailer
	default from: 'info.wisenutrition@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://wisenutrition.in/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to WiseNutrition - Online Clinic By Dt. Karishma Saxena.')
  end

  def new_user_registration_email(user)
    @user = user
    @url  = 'http://wisenutrition.in/users/sign_in'
    mail(to: 'anuraag.jpr@gmail.com', subject: @user.email + ' Just Registered with Wise Nutrition.')
  end
end
