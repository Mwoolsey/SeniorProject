namespace :transactions do
  desc "Rake task to create transactions"
  task :debit => :environment do
    @transactions = Transaction.all
    @accounts = Account.all
    while (@transaction = @transactions.sample).description == "Deposit" do
    end
    while (@account = @accounts.sample).acctType == 1 do 
    end
    @amt = rand_in_range(1.00, 500.00).round(2)
    @account.balance -= @amt
    @transaction = Transaction.new (
      { :description => @transaction.description, :amount => (@amt * -1), :status => "complete", :account_id => @account.id, :currentBalance => @account.balance }
    )
    @transaction.save
    @account.save
    puts "Transaction created for #{@account.user.name}: #{@account.id}"
  end

  task :credit => :environment do
    @transactions = Transaction.all
    @transaction = @transactions.sample
    @accounts = Account.all
    @account = @accounts.sample
    @amt = rand_in_range(1.00, 500.00).round(2)
    @account.balance += @amt
    @transaction = Transaction.new (
      { :description => "Deposit", :amount => @amt, :status => "complete", :account_id => @account.id, :currentBalance => @account.balance }
    )
    @transaction.save
    @account.save
    puts "Transaction created for #{@account.user.name}: #{@account.id}"
  end
end
