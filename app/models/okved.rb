class Okved < ApplicationRecord
  validates :code, presence: true

  has_many :company_okved
  has_many :companies, through: :company_okved
end
