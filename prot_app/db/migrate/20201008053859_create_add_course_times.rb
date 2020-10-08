class CreateAddCourseTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :add_course_times do |t|

      t.string :held_day
      t.integer :held_hour
      t.integer :course_id
      
      t.timestamps
    end
  end
end
