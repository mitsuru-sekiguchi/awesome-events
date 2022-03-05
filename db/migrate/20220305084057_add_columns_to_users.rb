class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :login_times, :integer
    add_column :users, :delete_flag, :integer
  end
end
