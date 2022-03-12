class RenameUserIdColumnToUserInfromations < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_informations, :user_id, :user_account_id
  end
end
