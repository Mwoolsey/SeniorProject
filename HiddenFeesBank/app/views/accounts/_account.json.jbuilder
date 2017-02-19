json.extract! account, :id, :acctNumber, :balance, :acctType, :created_at, :updated_at
json.url account_url(account, format: :json)