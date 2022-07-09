class RemoveUserIdFromEventUser < ActiveRecord::Migration[6.0]
  def change
    remove_reference :event_users, :user, index: true
  end
end
