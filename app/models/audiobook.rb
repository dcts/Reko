class Audiobook < ApplicationRecord
  has_many :rekos, as: :content

  def to_s
    "#{title} (audiobook_id: #{id})"
  end
end
