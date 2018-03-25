class SessionsController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.find_by(email: params[:email])
    if @teacher
      if @teacher.authenticate(params[:password])
        session[:teacher_id] = @teacher.id
        redirect_to teacher_path(@teacher)
      end
    else
      render :new
    end
  end

  def destroy
    session.delete :teacher_id
  end
end
