class Payment < ApplicationRecord
  include Reportable

  has_many :material_payments, dependent: :destroy
  has_many :materials, through: :material_payments

  belongs_to :user

  accepts_nested_attributes_for :material_payments, allow_destroy: true

  validates :client_address, :client_payment, presence: true
  validates :client_payment, numericality: { :greater_than_or_equal_to => 0 }

  before_save :payment_total

  # Подсчет суммы использоанных материалов
  def used_material
    used_material = 0

    if client_new_connection?
      # 97 - это стоимость нового подключения
      used_material = 97
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
  # Подсчет количества клиентов, общей суммы расходов
  # и процентов за период
  #
  def self.total_and_percent_report(period)
    total_report_today,  percent_report_today = 0, 0.00
    period.each do |report|
      total_report_today += report.payment_total
    end
    percent_report_today = total_report_today * 0.05
    return period.length, total_report_today,  percent_report_today
  end

  #
  # Подсчет количества новых подключений и общей суммы
  #
  def self.total_new_connection_report(period)
    new_connection_length, total_new_connection = 0, 0
    period.each do |report|
      total_new_connection += report.used_material if report.client_new_connection?
      new_connection_length += 1
    end
    return new_connection_length, total_new_connection
  end
end