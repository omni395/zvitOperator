class Expence < ApplicationRecord
  include Report

  belongs_to :user

  validates :expence, :expence_value, presence: true
  validates :expence, length: {maximum: 100}
  validates :expence_value, numericality: { :greater_than_or_equal_to => 0 }
end
