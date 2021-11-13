class Claim < ApplicationRecord
  validates :reason, :location, presence: true
end
