class CreateOutgoingTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :outgoing_transfers do |t|
      t.integer :originAcctNumber
      t.integer :destinationAcctNumber
      t.integer :routingNumber
      t.decimal :amount
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
