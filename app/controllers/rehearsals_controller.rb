class RehearsalsController < ApplicationController
  before_action :set_rehearsal, only: [:show, :edit, :update, :destroy]
  
  def index
    @rehearsals = current_user.rehearsals
    @students = current_user.students
  end
  
  def new
    @events = current_user.events 
    @rehearsal = current_user.rehearsals.build
  end
  
  def create
    event = current_user.events.find(rehearsal_params[:event_id])
    @rehearsal = event.rehearsals.build(rehearsal_params)
    if @rehearsal.save
      redirect_to rehearsals_path, notice: "Added new rehearsal for #{event.name}."
    else
      render :new
    end
  end
  
  def show
    @students = current_user.students
  end
  
  def edit
  end 
  
  def update
    student_id = rehearsal_params[:student_id]
    attending = rehearsal_params[:going]
    attended = rehearsal_params[:went]
    
    if student_id
      attendance = Attendance.find_or_create_by(rehearsal_id: @rehearsal.id, student_id: student_id)
      case 
      when !attending.nil?
        attendance = attendance.update(going: attending)
        redirect_to rehearsal_path(@rehearsal)
      when !attended.nil?
        attendance = attendance.update(went: attended)
        redirect_to rehearsal_path(@rehearsal)
      end
      
    else
      @rehearsal.update(rehearsal_params)
      redirect_to rehearsal_path(@rehearsal), notice: "Rehearsal for #{@rehearsal.event.name} was successfully updated."
      
    end
  end
  
  def destroy
    @rehearsal.destroy
    redirect_to rehearsals_path, notice: "Rehearsal for #{@rehearsal.event.name} was destroyed."
  end
  
  private
  
  def set_rehearsal
    begin 
      @rehearsal = current_user.rehearsals.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @rehearsal = nil
      redirect_to rehearsals_path, notice: "Rehearsal record not found."
    else
      @rehearsal = current_user.rehearsals.find(params[:id])
    end
  end
  
  def rehearsal_params
    params.require(:rehearsal).permit(:event_id, :venue, :time, :student_id, :going, :went)
  end
end