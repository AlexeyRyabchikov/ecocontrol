class Company < ApplicationRecord
  has_many :order_companies, dependent: :destroy
  has_many :orders, through: :order_companies

  validates :name, presence: true

  has_many :company_okved
  has_many :okveds, through: :company_okved
end
