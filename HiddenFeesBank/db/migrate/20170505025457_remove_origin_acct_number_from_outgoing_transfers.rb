class RemoveOriginAcctNumberFromOutgoingTransfers < ActiveRecord::Migration[5.0]
  def change
    remove_column :outgoing_transfers, :originAcctNumber, :integer
  end
end
