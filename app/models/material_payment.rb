class MaterialPayment < ApplicationRecord
  belongs_to :payment
  belongs_to :material
end
