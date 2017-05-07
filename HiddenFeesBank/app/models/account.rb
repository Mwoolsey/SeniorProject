# functions for getting random numbers
def rand_int(from, to)
  rand_in_range(from, to).to_i
end
def rand_price(from, to)
  rand_in_range(from, to).round(2)
end
def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end
def rand_in_range(from, to)
  rand * (to - from) + from
end
#-------------------------------------------------------------------------------

class Account < ApplicationRecord
  has_many :users, through: :user_accounts
  has_many :user_accounts
  has_many :auto_bill_payments
  has_many :internal_transfers
  has_many :outgoing_transfers
  has_many :sms_alerts
  has_many :transactions


  # get the 15 most recent transactions
  def transactionSummary
    transactions = self.transactions.sort { |a,b| a.created_at <=> b.created_at }
    transactions.pop(15)
  end

  transactions = Array.new(500) {Array.new}
  locationNumber = (0...9999).to_a.shuffle.take(500)
  businesses = File.readlines("db/businesses.txt")
  cities = File.readlines("db/cities.txt")
  transactions.each_with_index do |t,i| 
    t << "POS PURCHASE MERCHANT PURCHASE TERMINAL"
    t << "%04d" % locationNumber[i]
    t << businesses[rand_int(0,businesses.size - 1)]
    t << cities[rand_int(0,cities.size - 1)]
    t << "CA"
  end

  def generate_debit_transaction
    amt = -(rand_price(0.01, 500))
    acct = Account.all[rand_int(0,Account.all.size-1)]
    acct.balance -= amt
    trans = Transaction.create (
      { :description => transactions[rand_int(0,transactions.size-1)].join(" "), :amount => amt,
	:status => "complete", :account_id => acct.id, :currentBalance => acct.balance
      } 
    )
  end
  
  def generate_credit_transaction
    amt = (rand_price(100, 5000))
    acct = Account.all[rand_int(0,Account.all.size-1)]
    acct.balance -= amt
    trans = Transaction.create (
      { :description => transactions[rand_int(0,transactions.size-1)].join(" "), :amount => amt,
	:status => "complete", :account_id => acct.id, :currentBalance => acct.balance
      } 
    )
  end
end
