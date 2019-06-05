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

  # RANDOMLY ASSIGN AVATAR
  validate :assign_random_avatar

  # FINDS USER BY TOKEN
  # if token exists, returns user instance, else returns nil
  def self.find_by_token(token)
    User.token_hashmap[token] ? User.token_hashmap[token] : nil
  end

  def self.token_valid?(token)
    User.token_hashmap[token] ? true : false
  end

  def self.token_invalid?(token)
    !User.token_valid?(token)
  end

  # Class method that returns a hash with key=token and value=user
  # -> needed to check if a link exists in the rekos controller
  def self.token_hashmap
    hashmap = {}
    all.each { |user| hashmap[user.token] = user }
    hashmap
  end

  # custom "to_string" method
  def to_s
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # checks if user is an admin
  def admin?
    admin
  end

  # returns role of the user as string
  def role
    admin ? "admin" : "user"
  end

  # assigns random avatar
  # HARDCODED 9 random AVATARS
  def assign_random_avatar
    self.image_url = "random_avatars/#{(rand * 9).ceil}.png" if image_url.nil?
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
