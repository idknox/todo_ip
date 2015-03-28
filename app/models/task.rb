class Task < ActiveRecord::Base
  belongs_to :user

  validates :details, :due_date, presence: true

  validate :due_date_must_be_future

  def due_date_must_be_future
    errors.add(:base, "Due Date must be a future date") if due_date < Time.now
  end

end
