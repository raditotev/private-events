class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:id])
    logout(user)
    redirect_to root_url
  end

end
