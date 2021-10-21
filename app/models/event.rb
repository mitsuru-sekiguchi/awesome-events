class Event < ApplicationRecord
  has_one_attached :image, dependent: false
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: "User"
  attr_accessor :remove_image

  before_save :remove_image_if_user_accept

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :place, length: { maximum: 100 }
    validates :content, length: { maximum: 2000 }
    validates :start_at
    validates :end_at
  end
  validates :image, content_type: [:png, :jpg, :jpeg],
  size: { less_than_or_equal_to: 10.megabytes },
  dimension: { width: { max: 2000 }, height: { max: 2000 }}

  validate :start_at_shoulde_be_before_end_at
  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  private

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end

  def start_at_shoulde_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了よりも前に設定して下さい")
    end
  end
end
