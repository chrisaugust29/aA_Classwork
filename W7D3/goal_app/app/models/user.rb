class User < ApplicationRecord
  validates :username, :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 7 }

  attr_reader :password

  has_many :goals,
  foreign_key: :user_id,
  class_name: "Goal"

  has_many :cheers,
  foreign_key: :user_id,
  class_name: "Cheer"

  has_many :cheered_goals,
  through: :cheers,
  source: :goals

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && is_password?(password)
      user
    else
      nil
    end
  end

end
