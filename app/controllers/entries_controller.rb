class EntriesController < ApplicationController
  def index
    @students = current_user.students
  end
  
  def show
    @student = Student.find(params[:student_id])
    @entry = Entry.find(params[:id])
  end
  
  def new
    @student = current_user.students.find(params[:student_id])
    @entry = @student.entries.build
  end
  
  def create
    @student = current_user.students.find(params[:student_id])
    @entry = @student.entries.new(entry_params)
    if @entry.save
      redirect_to student_entries_path(@student), notice: "Added new entry for #{@student.name}." 
    else
      render :new
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end