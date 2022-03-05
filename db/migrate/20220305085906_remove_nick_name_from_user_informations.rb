class RemoveNickNameFromUserInformations < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_informations, :nickname, :string
    remove_column :user_informations, :email, :string
  end
end
