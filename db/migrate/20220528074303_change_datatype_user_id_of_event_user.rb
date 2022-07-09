class ChangeDatatypeUserIdOfEventUser < ActiveRecord::Migration[6.0]
  def change
    change_column :event_users, :user_id, :string
  end
end
