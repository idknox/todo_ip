class Task < ActiveRecord::Base
  belongs_to :user

  validates :details, :due_date, presence: true

  validate :due_date_must_be_future

  def due_date_must_be_future
    if due_date && due_date < Time.now
      errors.add(:base, "Due Date must be a future date")
    end
  end

  def days_completed_early
    (due_date - completed_on).to_i if completed_on
  end

  def overdue?
    due_date - Date.today < 0 && !complete if due_date
  end

  def completed_early?
    (due_date - completed_on).to_i > 0
  end

  def days_overdue
    (Date.today - due_date).to_i
  end

  def due_soon?
    due_date == Date.tomorrow && !complete
  end
end
