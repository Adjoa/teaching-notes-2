class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helpers do
    def logged_in?
      !!session[:teacher_id]
    end
    
    def current_user
      session[:name]
    end
  end

end
