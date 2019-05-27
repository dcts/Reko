class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :rekos
  has_many :rekos_received, inverse_of: :receiver, class_name: "Reko", foreign_key: "receiver_id"
  # has_many :rekos_given, inverse_of: :teller, class_name: "Reko", foreign_key: "reller_id"
  has_many :user_preferences
  has_many :preference, through: :user_preferences

  before_create :generate_tokens # url tokens
  validates :token, uniqueness: true

  def self.token_hashmap
    token_hashmap = {}
    all.each { |user| token_hashmap[user.token] = user.id }
    token_hashmap
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  protected

  # solution taken from here: https://stackoverflow.com/a/12109098/6272061
  def generate_tokens
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
