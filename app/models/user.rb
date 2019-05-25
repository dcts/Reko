class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :rekos
  has_many :received_rekos, inverse_of: :asker, class_name: "Reko", foreign_key: "asker_id"
  # has_many :given_rekos, inverse_of: :teller, class_name: "Reko", foreign_key: "reller_id"

  before_create :generate_tokens # url tokens
  validates :token, uniqueness: true

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
