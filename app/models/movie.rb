class Movie < ApplicationRecord
  has_many :rekos, as: :recommendable

  validates :itunes_id, presence: true, null: false
  validates :image_url, presence: true, null: false

  def to_s
    "#{title}"
  end

  def self.all_by_popularity
    # sort all movies by popularity (most recommended at the top!)
    Movie.all.sort_by { |movie| movie.rekos.size }.reverse
  end
end
