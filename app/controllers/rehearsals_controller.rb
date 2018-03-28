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
      redirect_to rehearsals_path, notice: "Added new rehearsal for #{event.name}."
    else
      render :new
    end
  end
  
  def show
    @rehearsal = Rehearsal.find(params[:id])
  end
  
  def edit
    @rehearsal = Rehearsal.find(params[:id])
  end 
  
  def update
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.update(rehearsal_params)
    redirect_to rehearsal_path(@rehearsal), notice: "Rehearsal for #{@rehearsal.event.name} was successfully updated."
  end
  
  def destroy
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.destroy
    redirect_to rehearsals_path, notice: "Rehearsal for #{@rehearsal.event.name} was destroyed."
  end
  
  private
  
  def rehearsal_params
    params.require(:rehearsal).permit(:event_id, :venue, :time)
  end
end