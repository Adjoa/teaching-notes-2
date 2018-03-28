class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save 
      redirect_to event_path(@event), notice: "Event was successfully created."
    else
      render :new
    end
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to events_path, notice: "Event was successfully upddated."
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name, :time, :venue)
  end
end
