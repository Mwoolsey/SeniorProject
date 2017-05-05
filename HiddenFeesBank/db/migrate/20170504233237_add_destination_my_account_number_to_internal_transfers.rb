class AddDestinationMyAccountNumberToInternalTransfers < ActiveRecord::Migration[5.0]
  def change
    add_column :internal_transfers, :destinationMyAccountNumber, :integer
  end
end
