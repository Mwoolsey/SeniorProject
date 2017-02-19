class CreateAutoBillPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :auto_bill_payments do |t|
      t.integer :originAcctNumber
      t.integer :destinationAcctNumber
      t.decimal :amount
      t.string :businessName
      t.string :businessAddress
      t.date :dateToPay
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
