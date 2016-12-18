class MaterialPayment < ApplicationRecord
  belongs_to :material
  belongs_to :payment
end
