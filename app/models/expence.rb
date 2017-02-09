class Expence < ApplicationRecord
  include Reportable

  belongs_to :user

  validates :expence, :expence_value, presence: true
  validates :expence, length: {maximum: 100}
  validates :expence_value, numericality: { :greater_than_or_equal_to => 0 }

  #
  # Подсчет общей суммы расходов то датам
  #
  def self.total_expence_report(period)
    total_expence = 0
    period.each do |expence|
      total_expence += expence.expence_value
    end
    return total_expence
  end
end
