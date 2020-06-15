class RemoveGidFromusers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :GID
  end

  def down
    add_column :users, :GID, :integer
  end
end
