class CreateUserInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_informations do |t|
      t.string :nickname
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
