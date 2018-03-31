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
      redirect_to student_path(@entry.student), notice: "Added new entry for #{@entry.student.name}." 
    else
      render :new
    end
  end
  
  def edit
  end 
  
  def update
    @entry.update(entry_params)
    if @entry.valid?
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
    
  def set_entry
    student = current_user.students.find_by(id: params[:student_id])
    
    if student  
      @entry = student.entries.find_by(id: params[:id])
      if @entry.nil?
        redirect_to student_path(student), notice: "Record not found."
      else
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