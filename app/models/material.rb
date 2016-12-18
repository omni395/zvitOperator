class Material < ApplicationRecord
  has_many :material_payments
  has_many :payments, through: :material_payments
end
