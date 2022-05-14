class Event < ApplicationRecord
  searchkick language: "japanese"
  has_one_attached :image, dependent: false
  has_many :tickets, dependent: :destroy

  attr_accessor :remove_image

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users

  before_save :remove_image_if_user_accept

  # validates :image, content_type: [:png, :jpg, :jpeg],
  # size: { less_than_or_equal_to: 10.megabytes },
  # dimension: { width: { max: 2000 }, height: { max: 2000 }}

  # def created_by?(user)
  #   return false unless user
  #   owner_id == user.id
  # end

  private

  def search_data
    {
      name: name,
      place: place,
      content: content,
      # owner_name: owner&.name,
      start_at: start_at
    }
  end

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
