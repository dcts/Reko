class Movie < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} (#{year})"
  end
end
