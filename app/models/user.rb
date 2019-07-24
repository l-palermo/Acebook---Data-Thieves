class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,        presence: true
  validates :email,       presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,    presence: true, length: { maximum: 10, minimum: 6 }

  has_many :posts
end
