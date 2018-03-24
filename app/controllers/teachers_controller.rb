class TeachersController < ApplicationController
  def welcome
  end
  
  def new
    @teacher = Teacher.new
  end
end
