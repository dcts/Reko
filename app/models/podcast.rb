class Podcast < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} (podcast_id: #{id})"
  end
end
