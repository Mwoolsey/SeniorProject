namespace :transactions do
  desc "Rake task to create transactions"
  task :debit => :environment do
    @transactions = Transaction.all
    @accounts = Account.all
    # find a random transaction (that isn't a deposit) to copy a description
    # from to simulate debits
    while (@transaction = @transactions.sample).description == "Deposit" do
    end
    # find a random account that isn't a savings account to create the 
    # transaction for
    while (@account = @accounts.sample).acctType == 1 do 
    end
    #@account = @accounts[36]
    @amt = rand_in_range(1.00, 500.00).round(2)
    #@amt = 5.00;
    @account.update_attribute :balance, @account.balance - @amt
    @transaction = Transaction.new (
      { :description => @transaction.description,
       	:amount => (@amt * -1),
       	:status => "complete",
       	:account_id => @account.id,
       	:currentBalance => @account.balance,
       	:created_at => (Time.now - 7.hours)
      }
    )
    @transaction.save
    puts "Transaction created for #{@account.user.name}: #{@account.id}, with an amount of #{-1*@amt}"
  end

  task :credit => :environment do
    @transactions = Transaction.all
    @transaction = @transactions.sample
    @accounts = Account.all
    @account = @accounts.sample
    @amt = rand_in_range(1.00, 500.00).round(2)
    @account.balance += @amt
    @transaction = Transaction.new (
      { :description => "Deposit",
       	:amount => @amt,
       	:status => "complete",
       	:account_id => @account.id,
       	:currentBalance => @account.balance, 
       	:created_at => (Time.now - 7.hours)
      }
    )
    @transaction.save
    @account.save
    puts "Transaction created for #{@account.user.name}: #{@account.id}, with an amount of #{@amt}"
  end
end
