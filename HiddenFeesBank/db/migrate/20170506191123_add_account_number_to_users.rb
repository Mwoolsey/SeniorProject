class AddAccountNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :accountNumber, :integer
  end
end
