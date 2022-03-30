class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :delete_flag, from: nil, to: "0"
    change_column_default :users, :login_times, from: nil, to: "0"
    change_column_default :user_informations, :delete_flag, from: nil, to: "0"
    change_column_default :events, :delete_flag, from: nil, to: "0"
  end
end
