class OrderCompany < ApplicationRecord
  belongs_to :order
  belongs_to :company
end
