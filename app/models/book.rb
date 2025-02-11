class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  def available?
    borrowings.where(returned: false).count == 0
  end
end
