class InvitationsController < ApplicationController
  before_action :correct_user

  def create
    @event = Event.find(params[:event_id])
    guest = User.find_by(email: params[:invitation][:guest_email])
    if guest && @event
      @event.invitations.create(guest_id: guest.id)
      redirect_to @event
    else
      # Add error message
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    invitation = Invitation.find_by(event_id: params[:event_id], guest_id: params[:guest_id])
    invitation.destroy
    redirect_to @event
  end

  private

  def correct_user
    user = User.find(params[:id])
    redirect_to root_url unless user == current_user
  end

end
