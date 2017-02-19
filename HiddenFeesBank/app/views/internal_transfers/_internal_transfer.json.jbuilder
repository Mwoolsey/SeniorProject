json.extract! internal_transfer, :id, :originAcctNumber, :destinationAcctNumber, :amount, :account_id, :created_at, :updated_at
json.url internal_transfer_url(internal_transfer, format: :json)