class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to events_path, notice: "Event was successfully upddated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "#{@event.name} record was destroyed."
  end
  
  private
  
  def set_event
    begin
      @event = current_user.events.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @event = nil
      redirect_to events_path, notice: "Event record not found"
    else
      @event = current_user.events.find(params[:id])
    end
  end
  
  def event_params
    params.require(:event).permit(:name, :time, :venue)
  end
end
