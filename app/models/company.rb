class Company < ApplicationRecord
  has_many :order_companies, dependent: :destroy
  has_many :orders, through: :order_companies

  validates :name, presence: true

  belongs_to :okved, optional: true
end
