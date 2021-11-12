class Okved < ApplicationRecord
  validates :code, presence: true

  has_many :company
end
