class EventUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  serialize :user_id, Array
end
