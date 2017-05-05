namespace :internal_transfers do
  desc "Rake task to handle internal transfers"
  task :run => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get '/users/sign_in'
    csrf_token = session.session[:_csrf_token]
    session.post '/users/sign_in', {:authenticity_token => csrf_token, :user => {:email => "a@a.com", :password => "a"}}
    transfers = InternalTransfer.all
    transfers.each do |transfer|
      destination = transfer.destinationAcctNumber
      amount = transfer.amount
      originAcct = transfer.account_id
      originAcctBalance = Account.find(originAcct).balance
      destinationAcctBalance = Account.find(destination).balance

      # create the transaction for the sender
      session.post "/accounts/#{originAcct}/transactions#create", {
	description: "Transfer of #{sprintf("%.2f", amount)} to acct#: #{destination}",
	amount: (amount * -1),
	status: 'complete',
	account_id: originAcct,
	currentBalance: originAcctBalance - amount,
	created_at: Time.now - 7.hours
      }

      # create the transaction for the receiver
      session.post "/accounts/#{destination}/transactions#create", {
	description: "Transfer of #{sprintf("%.2f", amount)} from acct#: #{originAcct}",
	amount: amount,
	status: 'complete',
	account_id: destination,
	currentBalance: destinationAcctBalance + amount,
	created_at: Time.now - 7.hours
      }
      transfer.destroy
    end
  end
end
