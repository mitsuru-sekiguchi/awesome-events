class Event < ApplicationRecord
  has_one_attached :image
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: "User"

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :place, length: { maximum: 100 }
    validates :content, length: { maximum: 2000 }
    validates :start_at
    validates :end_at
  end
  validate :start_at_shoulde_be_before_end_at

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  private

  def start_at_shoulde_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了よりも前に設定して下さい")
    end
  end
end
