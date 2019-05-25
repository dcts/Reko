class Reko < ApplicationRecord
  belongs_to :list
  belongs_to :content, polymorphic: true

  def self.display
    self.all.map { |x| x.to_s }.each { |x| puts x }
  end

  def to_s
    "reko given by #{creator_name} to #{list.owner.to_s}: #{content.to_s}"
  end
end
