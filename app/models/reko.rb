class Reko < ApplicationRecord
  # OLD WAY OF CONNECTING USER (= REKO ASKER)
  # belongs_to :user
  # NEW WAY (with alias)
  belongs_to :asker, class_name: "User", foreign_key: "asker_id"
  # for the MVP the teller is stored as field "teller_name"
  # eventually we will want to do this:
  # belongs_to :teller, class_name: "User", foreign_key: "teller_id"
  belongs_to :content, polymorphic: true

  def self.display
    all.map { |x| x.to_s }.each { |x| puts x }
  end

  def to_s
    "reko given by #{teller_name ? teller_name : "unknown"} to #{asker.to_s}: #{content.to_s}"
  end
end
