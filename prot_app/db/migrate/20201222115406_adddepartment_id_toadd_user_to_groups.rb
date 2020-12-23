class AdddepartmentIdToaddUserToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :add_user_to_groups, :department_id, :integer
  end
end
