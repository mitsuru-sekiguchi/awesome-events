class AddReferencesToEventUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_users, :user_information, null: false, foreign_key: true
  end
end
