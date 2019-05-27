class BetaApplicant < ApplicationRecord
  validates :email, presence: true
end
