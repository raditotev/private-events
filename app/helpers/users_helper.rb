module UsersHelper

  def creator?(user)
    current_user.id == user.id
  end
end
