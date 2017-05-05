class InternalTransfer < ApplicationRecord
  belongs_to :account
  attr_accessor :myAccountNumber
end
