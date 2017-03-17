json.extract! transaction, :id, :transactionNumber, :description, :amount, :status, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)