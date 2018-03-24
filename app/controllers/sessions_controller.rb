class SessionsController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.find_by(email: params[:email]).authenticate(params[:password])
    if @teacher
      current_user = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def destroy
  end
end
