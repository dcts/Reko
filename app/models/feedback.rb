class Feedback < ApplicationRecord
  validates :content, presence: true, null: false
end
