class Movie < ApplicationRecord
  has_many :rekos, as: :recommendable

  def to_s
    "#{title}"
  end

  def self.all_by_popularity
    # sort all movies by popularity (most recommended at the top!)
    Movie.all.sort_by { |movie| movie.rekos.size }.reverse
  end
end
