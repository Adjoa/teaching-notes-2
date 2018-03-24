class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def logged_in?
    !!session[:teacher_id]
  end
  
  def current_user
    session[:teacher_id]
  end

end
