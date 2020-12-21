class AddClassnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :classname, :string
  end
end
