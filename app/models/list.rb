class List < ApplicationRecord
  belongs_to :owner, :class_name => :User, :foreign_key => "user_id"
  has_many :rekos
  before_create :generate_tokens # url tokens
  validates :owner_token, uniqueness: true
  validates :visitor_token, uniqueness: true

  protected

  def generate_tokens
    self.owner_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false) + "adm"
      break random_token unless List.exists?(owner_token: random_token)
    end
    self.visitor_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless List.exists?(visitor_token: random_token)
    end
  end
end
