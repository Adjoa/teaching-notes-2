class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @students = current_user.students
  end
  
  def show
    @entry = current_user.students.find(params[:id]).entries.build
    @entries = current_user.students.find(params[:id]).entries
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
    @student = current_user.students.find(params[:id])
  end
  
  def update
    if @student.update(student_params)
      redirect_to student_path(@student), notice: 'Student record was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @student.destroy
    redirect_to students_path, notice: "Student record for #{@student.name} was destroyed."
  end
  
  private
  
  def set_student
    begin
      @student = current_user.students.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @student = nil
      redirect_to students_path, notice: "Student record not found."
    else
      @student = current_user.students.find(params[:id])
    end
  end
  
  def student_params
    params.require(:student).permit(:name, :email)
  end
end