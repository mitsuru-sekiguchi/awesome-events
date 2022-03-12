class RenameDepartColumnToCompanys < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_informations, :depart, :company
  end
end
