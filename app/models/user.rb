class User < ActiveRecord::Base

  def User.create_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
