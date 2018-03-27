class EntriesController < ApplicationController
  def index
    @students = current_user.students
  end
  
  def show
    @entry = Entry.find(params[:id])
  end
end