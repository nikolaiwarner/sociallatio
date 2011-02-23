class UserMailer < ActionMailer::Base
  default :from => "friends@sociallatio.com"
 
  def status_email(user)
    @user = user
    @url  = "http://sociallatio.com"
    mail(:to => user.email, :subject => "[sociallatio] your status today")
  end
  
end
