class Movie < ApplicationRecord
  has_many :rekos, as: :recommendable

  def to_s
    "#{title} (movie_id: #{id})"
  end
end
