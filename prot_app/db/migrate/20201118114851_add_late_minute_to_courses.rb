class AddLateMinuteToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :late_minute, :integer
  end
end
