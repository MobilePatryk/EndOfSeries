class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,:main_user,:mobile?
  require 'google/apis/analytics_v3'
  

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def main_user
      @main_user = User.first
  end
  
  def logged_in?
      !!current_user
  end
  
  def require_user
     if !logged_in? 
         flash[:danger] = "Musisz być zalogowany aby wykonać tą akcje"
         redirect_to root_path
     end
  end

   private

   def mobile? # has to be in here because it has access to "request"
      request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
   end
end
