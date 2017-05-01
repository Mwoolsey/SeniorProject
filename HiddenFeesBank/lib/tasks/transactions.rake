namespace :transactions do
  desc "Rake task to create transactions"
  task :debit => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get '/users/sign_in'
    csrf_token = session.session[:_csrf_token]
    session.post '/users/sign_in', {:authenticity_token => csrf_token, :user => {:email => "a@a.com", :password => "a"}}

    @transactions = Transaction.all
    @accounts = Account.all
    @amt = rand_in_range(-500.00, -1.00).round(2)
    # find a random transaction (that isn't a deposit) to copy a description
    # from to simulate debits
    while (@transaction = @transactions.sample).description == "Deposit" do
    end
    # find a random account that isn't a savings account to create the 
    # transaction for
    while (@account = @accounts.sample).acctType == 1 do 
    end
    @account = @accounts[36]
    @amt = -1051.00;
    session.post "/accounts/#{@account.id}/transactions#create", { description: @transaction.description, amount: @amt, status: 'complete', account_id: @account.id, currentBalance: @account.balance + @amt, created_at: Time.now - 7.hours }
    puts "Transaction created for #{@account.user.name}: #{@account.id}, with an amount of #{@amt}"
  end

  task :credit => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get '/users/sign_in'
    csrf_token = session.session[:_csrf_token]
    session.post '/users/sign_in', {:authenticity_token => csrf_token, :user => {:email => "a@a.com", :password => "a"}}

    @transactions = Transaction.all
    @transaction = @transactions.sample
    @accounts = Account.all
    @account = @accounts.sample
    @amt = rand_in_range(100.00, 800.00).round(2)
    @account = Account.all[36]
    @amt = 844.00
    session.post "/accounts/#{@account.id}/transactions#create", { description: 'Deposit', amount: @amt, status: 'complete', account_id: @account.id, currentBalance: @account.balance + @amt, created_at: Time.now - 7.hours }
    puts "Transaction created for #{@account.user.name}: #{@account.id}, with an amount of #{@amt}"
  end
end
