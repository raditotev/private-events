class UsersController < ApplicationController

  def index
    @upcoming_events = Event.where('date >= ?', Time.now).limit(3)
    @past_events = Event.where('date < ?', Time.now).limit(3)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in user
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.events.where('date >= ?', Time.now)
    @past_events = @user.events.where('date < ?', Time.now)
    # @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
