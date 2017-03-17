class AddAccountNameToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :accountName, :string
  end
end
