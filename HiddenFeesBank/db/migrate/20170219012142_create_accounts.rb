class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :acctNumber
      t.decimal :balance
      t.integer :acctType
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
