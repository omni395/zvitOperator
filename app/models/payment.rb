class Payment < ApplicationRecord
  has_many :material_payments, dependent: :destroy
  has_many :materials, through: :material_payments

  accepts_nested_attributes_for :material_payments, allow_destroy: true

  validates :client_address, :client_payment, presence: true
  validates :client_payment, numericality: { :greater_than_or_equal_to => 0 }

  before_save :payment_total

  # Получено за израсходованные материалы
  def self.material_total
    used_material = 0
    array_used_material = MaterialPayment.where(payment_id: id)

    array_used_material.each do |a|
      used_material += a.material.material_price * a.quantity
    end
  end

  def payment_by_dates(date)
    
  end

  # Подсчет общей суммы платежа
  def payment_total
    used_material = 0
    array_used_material = MaterialPayment.where(payment_id: id)

    if client_new_connection?
      array_used_material.each do |a|
      used_material += a.material.material_price * a.quantity
      end
    end

    payment_total = client_payment + used_material
    write_attribute :payment_total, payment_total
  end
end