class AddCurrentBalanceToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :currentBalance, :decimal
  end
end
