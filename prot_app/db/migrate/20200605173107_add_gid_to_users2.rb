class AddGidToUsers2 < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :GID, :string
  end
end
