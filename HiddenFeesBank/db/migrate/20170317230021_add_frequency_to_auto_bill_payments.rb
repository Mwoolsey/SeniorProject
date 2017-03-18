class AddFrequencyToAutoBillPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :auto_bill_payments, :frequency, :string
  end
end
