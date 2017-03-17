class AddSsnToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :ssn, :integer
  end
end
