class RemoveDestinationMyAccountNumberFromInternalTransfers < ActiveRecord::Migration[5.0]
  def change
    remove_column :internal_transfers, :destinationMyAccountNumber, :integer
  end
end
