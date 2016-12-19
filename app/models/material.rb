class Material < ApplicationRecord
  has_many :material_payments
  has_many :payments, through: :material_payments

  validates :material_price, numericality: { :greater_than_or_equal_to => 0 }
  validates :material, :material_price, presence: true
end
