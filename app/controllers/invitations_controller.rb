class InvitationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    user = User.find_by(email: params[:invitation][:guest_email])
    if user && @event
      @event.invitations.create(guest_id: user.id)
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
end
