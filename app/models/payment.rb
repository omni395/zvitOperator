class Payment < ApplicationRecord
  validates :client_address, :client_payment, presence: true
  validates :client_payment, numericality: { :greater_than_or_equal_to => 0 }
end
