class UserMailer < ActionMailer::Base
  default :from => "today@sociallatio.com"
 
  def status_email(user)
    @user = user
    @url  = "http://sociallatio.com"
    mail(:to => user.email, :subject => "[sociallatio] status update")
  end
  
end
