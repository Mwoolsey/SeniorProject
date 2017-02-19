class Account < ApplicationRecord
  has_many :users, through: :user_accounts
  has_many :user_accounts
  has_many :auto_bill_payments
  has_many :internal_transfers
  has_many :outgoing_transfers
  has_many :sms_alerts
  
end
