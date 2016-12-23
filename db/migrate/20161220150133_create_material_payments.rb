class CreateMaterialPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :material_payments do |t|
      t.string :quantity, default: 0
      t.references :payment, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
