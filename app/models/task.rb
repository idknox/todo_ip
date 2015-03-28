class Task < ActiveRecord::Base
  belongs_to :user

  validates :details, presence: true

  validate :due_date_must_be_future

  def due_date_must_be_future
    if due_date && due_date < Time.now
      errors.add(:base, "Due Date must be a future date")
    end
  end

  def days_completed_early
    (due_date - completed_on).to_i if completed_on
  end
end
