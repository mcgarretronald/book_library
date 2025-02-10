class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validates :returned, inclusion: { in: [ true, false ] }

  before_create :set_due_date

  private

  def set_due_date
    self.due_date ||= 2.weeks.from_now.to_date
  end
end
