class EntriesController < ApplicationController
  def index
    @students = current_user.students
  end
end