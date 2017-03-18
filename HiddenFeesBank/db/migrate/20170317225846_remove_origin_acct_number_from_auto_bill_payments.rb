class RemoveOriginAcctNumberFromAutoBillPayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :auto_bill_payments, :originAcctNumber, :integer
  end
end
