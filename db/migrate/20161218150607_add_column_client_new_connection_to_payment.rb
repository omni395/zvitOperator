class AddColumnClientNewConnectionToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :client_new_connection, :boolean
  end
end
