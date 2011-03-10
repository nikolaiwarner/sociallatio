class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :detect_browser
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  

private
  
  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    ["android", "ipod", "opera mini", "blackberry", "kindle", "mobile"].each do |m|
      return "application.mobile" if agent.match(m)
    end
    return "application"
  end
  
  
end
