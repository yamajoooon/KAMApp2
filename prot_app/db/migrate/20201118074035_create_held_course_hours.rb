class CreateHeldCourseHours < ActiveRecord::Migration[6.0]
  def change
    create_table :held_course_hours do |t|
      t.integer :held_hour
      t.string :start_time
      t.string :late_time

      t.timestamps
    end
  end
end
