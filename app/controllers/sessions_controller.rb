class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      sign_in user
      redirect_to current_user
    end
  end

end
