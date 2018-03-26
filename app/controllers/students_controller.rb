class StudentsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @students = user.students
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def create
  end
  
  def destroy
  end
  
  private
  
  def student_params
    params.require(:student).permit(:name, :email)
  end
end