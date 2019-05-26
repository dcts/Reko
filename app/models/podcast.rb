class Podcast < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} by #{artist} (EP: #{episode})"
  end
end
