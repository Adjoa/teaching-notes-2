class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def new
    student = current_user.students.find(params[:student_id])
    @entry = student.entries.build
  end
  
  def create
    @student = current_user.students.find(params[:student_id])
    @entry = @student.entries.new(entry_params)
    if @entry.save
      redirect_to student_path(@entry.student), notice: "Added new entry for #{@student.name}." 
    else
      render :new
    end
  end
  
  def edit
  end 
  
  def update
    if @entry.update(entry_params)
      redirect_to student_entry_path(@entry.student, @entry), notice: "Entry was successfully updated."
    else
      render :edit
    end
  end 
  
  def destroy
    @entry.destroy
    redirect_to student_path(@entry.student), notice: "#{@entry.title} was destroyed."
  end
  
  private
  
  def set_student
    begin 
      @student = current_user.students.find(params[:student_id])
    rescue ActiveRecord::RecordNotFound
      @student = nil
      redirect_to student_path(@student), notice: "Student record not found."
    else
      @student = current_user.students.find(params[:student_id])
    end
  end
    
  def set_entry
    student = current_user.students.find_by(id: params[:student_id])
    
    if student  
      begin
        @entry = student.entries.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @entry = nil
        redirect_to student_path(student), notice: "Record not found."
      else
        student = current_user.students.find(params[:student_id])
        @entry = student.entries.find(params[:id])
      end
    else
      redirect_to students_path, notice: "Record does not exist"
    end
  end
  
  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end