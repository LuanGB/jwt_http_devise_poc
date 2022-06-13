class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_by_jwt_payload(payload)
    find_by email: payload[:email]
  end

  def jwt_payload
    { email: email }
  end
end
