namespace :outgoing_transfers do
  desc "Rake task to handle external transfers"
  task :run => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get '/users/sign_in'
    csrf_token = session.session[:_csrf_token]
    session.post '/users/sign_in', {:authenticity_token => csrf_token, :user => {:email => "a@a.com", :password => "a"}}
    transfers = OutgoingTransfer.all
    transfers.each do |transfer|
      destination = transfer.destinationAcctNumber
      routingNumber = transfer.routingNumber
      amount = transfer.amount
      originAcct = transfer.account_id
      originAcctBalance = Account.find(originAcct).balance

      # create the transaction for the sender
      session.post "/accounts/#{originAcct}/transactions#create", {
	description: "Transfer of #{sprintf("%.2f", amount)} to acct#: #{destination}, Routing#: #{routingNumber}",
	amount: (amount * -1),
	status: 'complete',
	account_id: originAcct,
	currentBalance: originAcctBalance - amount,
	created_at: Time.now - 7.hours
      }
      transfer.destroy
    end
  end
end
