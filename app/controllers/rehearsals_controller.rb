class RehearsalsController < ApplicationController
  def index
    @rehearsals = current_user.rehearsals
    @students = current_user.students
  end
  
  def new
    @rehearsal = Rehearsal.new
  end
  
  def create
    event = Event.find(params[:rehearsal][:event_id])
    @rehearsal = event.rehearsals.build(rehearsal_params)
    if @rehearsal.save
      redirect_to rehearsals_path, notice: "Added new rehearsal for #{event.name}."
    else
      render :new
    end
  end
  
  def show
    @rehearsal = Rehearsal.find(params[:id])
    @students = current_user.students
  end
  
  def edit
    @rehearsal = Rehearsal.find(params[:id])
  end 
  
  def update
    # raise params.inspect
    @rehearsal = Rehearsal.find(params[:id])
    student_id = params[:rehearsal][:student_id]
    attending = params[:rehearsal][:going]
    # attended = params[:rehearsal][:went]
    
    if student_id
      attendance = Attendance.find_or_create_by(rehearsal_id: @rehearsal.id, student_id: student_id)
      case 
      when !params[:rehearsal][:going].nil?
        attendance = attendance.update(going: attending)
        binding.pry
        redirect_to rehearsal_path(@rehearsal)
      # when params[:rehearsal][:went]
      #   attendance = attendance.update(went: attended)
      #   redirect_to rehearsal_path(@rehearsal)
      end
    else
      @rehearsal.update(rehearsal_params)
      redirect_to rehearsal_path(@rehearsal), notice: "Rehearsal for #{@rehearsal.event.name} was successfully updated."
    end
  end
  
  def destroy
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.destroy
    redirect_to rehearsals_path, notice: "Rehearsal for #{@rehearsal.event.name} was destroyed."
  end
  
  private
  
  def rehearsal_params
    params.require(:rehearsal).permit(:event_id, :venue, :time, :student_id, :going)
  end
end