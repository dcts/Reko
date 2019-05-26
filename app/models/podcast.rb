class Podcast < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "\"#{title}\" by #{artist}"
  end
end
