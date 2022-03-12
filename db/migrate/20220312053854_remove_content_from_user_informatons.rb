class RemoveContentFromUserInformatons < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_informations, :content, :string
  end
end
