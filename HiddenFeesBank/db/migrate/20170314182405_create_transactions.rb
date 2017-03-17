class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :transactionNumber
      t.string :description
      t.decimal :amount
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
