class AddColumnsToUserInformations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_informations, :display_name, :string
    add_column :user_informations, :display_name_eng, :string
    add_column :user_informations, :depart, :string
    add_column :user_informations, :birthday, :string
    add_column :user_informations, :position, :string
    add_column :user_informations, :profile, :text
    add_column :user_informations, :delete_flag, :integer
    add_column :user_informations, :permission_level, :integer
  end
end
