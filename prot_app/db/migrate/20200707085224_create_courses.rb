class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :keyword
      t.string :tname
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
