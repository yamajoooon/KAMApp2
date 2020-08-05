class AddUserToGroup < ApplicationRecord
    def change
        create_table :add_user_to_groups do |t|
          t.integer :user_id
          t.integer :group_id
          t.boolean :activation, default: false, null: false
    
          t.timestamps
        end
    end

    def user
      return User.find_by(id: self.user_id)
    end

    def courses
      return Course.find_by(id: self.group_id)
    end
    
end
