# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness:true
  validates :session_token, presence: true
  validates :password_digest, length:{minimum: 6, allow_nil:true}
  validates :password_digest, presence:true

  after_intitalize :ensure_session_token
  attr_reader :password

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64()
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  
  end

  def is_password?(password)
    BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && is_password?(password)
    nil
  end

  

end
