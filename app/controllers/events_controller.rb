class EventsController < ApplicationController

  def index
    @upcoming_events = Event.where('date >= ?', Time.now)
    @past_events = Event.where('date < ?', Time.now)
  end

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.build(event_params)
    if event.save
      redirect_to event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end

end
