class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :client_address
      t.string :client_name
      t.decimal :client_payment
      t.string :client_description

      t.timestamps
    end
  end
end