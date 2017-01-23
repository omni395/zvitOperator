class Material < ApplicationRecord
  has_many :material_payments
  has_many :payments, through: :material_payments

  validates :material_name, :material_price, precense: true, length: { maximum: 30 }
  validates :material_price, numericality: { :greater_than_or_equal_to => 0 }
end
