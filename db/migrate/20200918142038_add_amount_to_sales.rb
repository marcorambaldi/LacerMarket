class AddAmountToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :amount, :integer
  end
end
