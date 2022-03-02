class AddContentToUserInformations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_informations, :content, :text
  end
end
