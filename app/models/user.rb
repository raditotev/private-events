class User < ActiveRecord::Base
  has_many :invitations, foreign_key: :guest_id, dependent: :destroy
  has_many :events, foreign_key: :host_id
  has_many :attendances, through: :invitations, source: :event

  def User.create_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
