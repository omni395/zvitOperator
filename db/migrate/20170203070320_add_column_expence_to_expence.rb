class AddColumnExpenceToExpence < ActiveRecord::Migration[5.0]
  def change
    add_column :expences, :expence, :string
  end
end
