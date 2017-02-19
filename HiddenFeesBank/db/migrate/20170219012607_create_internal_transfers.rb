class CreateInternalTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_transfers do |t|
      t.integer :originAcctNumber
      t.integer :destinationAcctNumber
      t.decimal :amount
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
