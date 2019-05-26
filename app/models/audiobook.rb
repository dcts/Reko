class Audiobook < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} by #{author}"
  end
end
