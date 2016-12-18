class CreateMaterialPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :material_payments do |t|
      t.references :material, foreign_key: true
      t.references :payment, foreign_key: true
      t.decimal :quantity
      t.decimal :total_material_price

      t.timestamps
    end
  end
end
