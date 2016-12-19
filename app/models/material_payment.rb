class MaterialPayment < ApplicationRecord
  belongs_to :material
  belongs_to :payment

  validates :total_material_price, :quantity, numericality: { :greater_than_or_equal_to => 0 }
end
