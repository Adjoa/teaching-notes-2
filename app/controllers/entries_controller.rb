class EntriesController < ApplicationController
  def index
  end
  
  def show
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
      redirect_to student_path(@entry.student), notice: "Added new entry for #{@student.name}." 
    else
      render :new
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    @student = @entry.student
  end 
  
  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to student_entry_path(@entry.student, @entry), notice: "Entry was successfully updated."
    else
      render :edit
    end
  end 
  
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to student_path(@entry.student), notice: "#{@entry.title} was destroyed."
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end