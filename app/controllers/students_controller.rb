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
    @student = current_user.students.build(student_params)
    if @student.save
      redirect_to student_path(@student), notice: 'Student record was successfully created.'
    else
      render :new
    end
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