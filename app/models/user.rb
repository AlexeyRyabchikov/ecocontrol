class User < ApplicationRecord
  extend Enumerize

  has_secure_password

  validates :email, presence: true, email: true
  validates :password, :role, presence: true

  enumerize :role, in: %i[admin inspector]
end