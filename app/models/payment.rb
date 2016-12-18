class Payment < ApplicationRecord
  has_many :material_payments, dependent: :destroy
  has_many :materials, through: :material_payments

  accepts_nested_attributes_for :materials

  validates :client_address, :client_payment, presence: true
  validates :client_payment, numericality: { :greater_than_or_equal_to => 0 }
end
