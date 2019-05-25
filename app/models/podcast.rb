class Podcast < ApplicationRecord
  has_many :rekoos, as: :recommendable
end
