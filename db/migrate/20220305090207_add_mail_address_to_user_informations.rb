class AddMailAddressToUserInformations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_informations, :mail_address, :string
  end
end
