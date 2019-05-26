class Documentary < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} (#{year})" # year in brackets
  end
end
