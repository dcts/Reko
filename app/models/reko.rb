class Reko < ApplicationRecord
  # OLD WAY OF CONNECTING USER (= REKO ASKER)
  # belongs_to :user
  # NEW WAY (with alias)
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  # for the MVP the teller is stored as field "teller_name"
  # eventually we will want to do this:
  # belongs_to :teller, class_name: "User", foreign_key: "teller_id"
  belongs_to :recommendable, polymorphic: true

  # STATUS of the reko
  enum status: { open: 0, done: 1, rejected: 2 }

  def self.display
    all.map { |x| x.to_s }.each { |x| puts x }
  end

  def to_s
    "reko given by #{sender_name} to #{receiver.to_s}: #{recommendable.to_s}"
  end
end
