class User < ActiveRecord::Base

  validates :name,  presence: true
  validates :email, presence: true
  has_secure_password
  before_save :remember
  has_many :posts
 
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def remember
    if self.remember_token.nil?
      remember_digest = User.digest(User.new_token.to_s)
      update_attribute(:remember_token, remember_digest)
    end
  end
end
