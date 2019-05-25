class Rekoo < ApplicationRecord
  belongs_to :list
  belongs_to :recommendable, polymorphic: true
end
