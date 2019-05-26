class Serie < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} (#{year}) [S#{season}]" # year in brackets
  end
end
