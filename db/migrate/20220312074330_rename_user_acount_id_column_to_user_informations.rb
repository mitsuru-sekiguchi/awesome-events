class RenameUserAcountIdColumnToUserInformations < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_informations, :user_account_id, :user_id
  end
end
