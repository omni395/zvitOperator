class Payment < ApplicationRecord
  has_many :material_payments, dependent: :destroy
  has_many :materials, through: :material_payments

  accepts_nested_attributes_for :material_payments, allow_destroy: true

  validates :client_address, :client_payment, presence: true
  validates :client_payment, numericality: { :greater_than_or_equal_to => 0 }

  before_save :payment_total

  # Подсчет суммы использоанных материалов
  def used_material
    used_material = 0

    if client_new_connection?
      array_used_material = MaterialPayment.where(payment_id: id)
      array_used_material.each do |a|
        used_material += a.material.material_price * a.quantity if a.material != nil
      end
    end
    return used_material
  end

  # Подсчет общей суммы платежа
  def payment_total
    payment_total = client_payment + used_material
    write_attribute :payment_total, payment_total
  end

  #
  # Выборки по датам
  #
  def self.today
    where("created_at >= ?", Date.today.to_date)
  end

  def self.week
    where('created_at >= ? AND created_at <= ?', Date.today.to_date - 1.week, Date.today.to_date)
  end

  def self.month
    where('created_at >= ? AND created_at <= ?', Date.today.to_date - 1.month, Date.today.to_date)
  end

  def self.by_date(start_date, end_date)
    where('created_at >= ? AND created_at <= ?', start_date, end_date)
  end
end