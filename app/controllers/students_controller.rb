class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @students = current_user.students
  end
  
  def show
  end
  
  def new
    @student = current_user.students.build
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def set_student
    @student = current_user.students.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:name, :email)
  end
end