class CreateExpences < ActiveRecord::Migration[5.0]
  def change
    create_table :expences do |t|
      t.references :user, foreign_key: true
      t.string :expence_description
      t.decimal :expence_value

      t.timestamps
    end
  end
end
