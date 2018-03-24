class TeachersController < ApplicationController
  def welcome
  end
  
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      redirect_to signup_path 
    end
  end
  
  def show
    @teacher = Teacher.find(params[:id])
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:name, :username, :email, :password)
  end
end
