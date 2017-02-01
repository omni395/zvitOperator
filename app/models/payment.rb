class Payment < ApplicationRecord
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
  def self.report_today
    where("updated_at >= ?", Date.today.to_date)
  end

  def self.report_week
    now = Date.today.to_date
    if now.wednesday?
      now -= 6.day
      where('updated_at >= ? AND updated_at <= ?', now, Date.today.to_date + 1.day)
    else
      until now.wednesday?
        now -= 1.day
      end
      where('updated_at >= ? AND updated_at <= ?', now, Date.today.to_date + 1.day)
  end

  def self.report_month
    year = Date.today.year
    month = Date.today.month
    where('updated_at >= ? AND updated_at <= ?', Date.new(year, month, 1), Date.today.to_date + 1.day)
  end

  def self.report_by_date(start_date, end_date)
    where('updated_at >= ? AND updated_at <= ?', start_date, end_date)
  end

  #
  # Подсчет общей суммы платежа и процентов то датам
  #
  def self.total_and_percent_report(period)
    total_report_today,  percent_report_today = 0, 0
    period.each do |report|
      total_report_today += report.payment_total
    end
    percent_report_today = total_report_today * 0.05
    return total_report_today,  percent_report_today, period.length
  end
end