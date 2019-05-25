class Podcast < ApplicationRecord
  has_many :rekos, as: :recommendable

  def to_s
    "#{title} (podcast_id: #{id})"
  end
end
