class Order < ApplicationRecord
  has_many :order_companies, dependent: :destroy
  has_many :companies, through: :order_companies
end
