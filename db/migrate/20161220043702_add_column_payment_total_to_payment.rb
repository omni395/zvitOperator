class AddColumnPaymentTotalToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :payment_total, :decimal, default: 0
  end
end
