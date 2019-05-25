class Movie < ApplicationRecord
  has_many :rekoos, as: :recommendable
end
