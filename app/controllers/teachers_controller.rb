class TeachersController < ApplicationController
  def welcome
  end
  
  def new
    @teacher = Teacher.new
  end
  
  def create
  end
  
  private
  
  def user_params
    params.require(:teacher).permit(:name, :username, :email, :password)
  end
end
