class User < ApplicationRecord
  has_many :borrowings
  has_many :books, through: :borrowings

  # Devise modules for authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
