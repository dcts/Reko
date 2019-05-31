class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :rekos
  has_many :rekos_received, inverse_of: :receiver, class_name: "Reko", foreign_key: "receiver_id"
  # has_many :rekos_given, inverse_of: :teller, class_name: "Reko", foreign_key: "reller_id"
  has_many :user_preferences
  has_many :preferences, through: :user_preferences

  before_create :generate_tokens # url tokens
  validates :token, uniqueness: true

  # Class method that returns a hash with key=token and value=user_id
  # -> needed to check if a link exists in the rekos controller
  def self.token_hashmap
    token_hashmap = {}
    all.each { |user| token_hashmap[user.token] = user.id }
    token_hashmap
  end

  # FINDS USER BY TOKEN
  # if token exists, returns user instance, else returns nil
  def self.find_by_token(token)
    user_id = token_hashmap[token]
    user_id.nil? ? nil : User.find(user_id)
  end

  # custom "to_string" method
  def to_s
    "#{first_name} #{last_name}"
  end

  # returns role of the user as string
  def role
    admin ? "admin" : "user"
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
