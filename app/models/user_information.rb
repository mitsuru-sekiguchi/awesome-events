class UserInformation < ApplicationRecord
  belongs_to :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true do
    validates :display_name, length: { maximum: 255 }
    validates :display_name_eng, length: { maximum: 255 }, format: { with: /\A[a-zA-Z]+\z/}
    validates :birthday, format: { with: /\A\d{4}[-]\d{2}[-]\d{2}\z/ }
    validates :mail_address, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  end
  with_options length: { maximum: 255 } do
    validates :company
    validates :position
  end
end
