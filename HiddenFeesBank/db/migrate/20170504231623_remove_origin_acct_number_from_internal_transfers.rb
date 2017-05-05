class RemoveOriginAcctNumberFromInternalTransfers < ActiveRecord::Migration[5.0]
  def change
    remove_column :internal_transfers, :originAcctNumber, :integer
  end
end
