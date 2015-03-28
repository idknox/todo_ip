class Task < ActiveRecord::Base
  belongs_to :user

  validates :details, presence: true

  validate :due_date_must_be_future

  def due_date_must_be_future
    if due_date && due_date < Time.now
      errors.add(:base, "Due Date must be a future date")
    end
  end
end
