class RehearsalsController < ApplicationController
  def index
    @rehearsals = Rehearsal.all
  end
  
  def new
    @rehearsal = Rehearsal.new
  end
  
  
  def create
    event = Event.find(params[:rehearsal][:event_id])
    @rehearsal = event.rehearsals.build(rehearsal_params)
    if @rehearsal.save
      redirect_to rehearsals_path, notice: "Sucessfully created new rehearsal for #{event.name}"
    else
      render :new
    end
  end
  
  private
  
  def rehearsal_params
    params.require(:rehearsal).permit(:event_id, :venue, :time)
  end
end