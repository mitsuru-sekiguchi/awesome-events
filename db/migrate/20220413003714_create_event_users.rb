class CreateEventUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_users do |t|
      t.references :user
      t.references :event, null: false, foreign_key: true, index: false
      t.bigint :owner_id

      t.timestamps
      add_index :event_users, :owner_id
    end
  end
end
