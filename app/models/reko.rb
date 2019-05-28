class Reko < ApplicationRecord
  # OLD WAY OF CONNECTING USER (= REKO RECEIVER)
  # belongs_to :user
  # NEW WAY (with alias)
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  # for the MVP the sender is stored as field "sender_name"
  # eventually we will want to do this:
  # belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recommendable, polymorphic: true
  belongs_to :movie, -> { where(rekos: {recommendable_type: 'Movie'}) }, foreign_key: 'recommendable_id', optional: true


  validates :sender_name, length: { minimum: 2 }

  # STATUS of the reko
  enum status: { open: 0, done: 1, rejected: 2 }

  def self.display
    all.map { |x| x.to_s }.each { |x| puts x }
  end

  def movie
    return unless recommendable_type == "Movie"
    super
  end

  def to_s
    "reko given by #{sender_name} to #{receiver.to_s}: #{recommendable.to_s}"
  end
end
