class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :details
      t.date :due_date
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
