class EventsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
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
