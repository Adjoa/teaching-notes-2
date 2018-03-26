class StudentsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @students = user.students
  end
end