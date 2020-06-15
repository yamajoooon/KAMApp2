class AddGidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :GID, :integer

  end
end
