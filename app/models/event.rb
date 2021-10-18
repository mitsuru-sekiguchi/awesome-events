class Event < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximun: 50 }
    validates :place, length: { maximun: 100 }
    validates :content, length: { maximun: 2000 }
    validates :start_at
    validates :end_at
  end
  validates :start_at_shoulde_be_before_end_at

  private

  def start_at_shoulde_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了よりも前に設定して下さい")
    end
  end
end
