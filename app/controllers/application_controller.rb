class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :mobile?
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

   private

   def mobile? # has to be in here because it has access to "request"
      request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
   end
end
