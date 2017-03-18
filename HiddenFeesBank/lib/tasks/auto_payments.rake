namespace :auto_payments do
  desc "Rake task to handle automatic bill payments"
  task :run => :environment do
    @auto_bill_payments = AutoBillPayment.all
    return if @auto_bill_payments.size < 1

    @auto_bill_payments.each do |payment|
      if payment.dateToPay == Date.today
	@account = Account.find(payment.account)
	@account.balance -= payment.amount
	@account.save
	@transaction = Transaction.new(
	  { :description => "Auto Payment to: #{payment.businessName}", :amount => (payment.amount * -1), :status => "complete", :account_id => @account.id, :currentBalance => @account.balance, :created_at => (Time.now - 7.hours) }
	)
	@transaction.save
	if payment.frequency == "once"
	  payment.destroy
	elsif payment.frequency == "daily"
	  payment.dateToPay += 1.day
	elsif payment.frequency == "weekly"
	  payment.dateToPay += 7.day
	elsif payment.frequency == "monthly"
	  payment.dateToPay += 1.month
	elsif payment.frequency == "yearly"
	  payment.dateToPay += 1.year
	end
	payment.save
	puts "Payment made for #{@account.user.name}: #{@account.id}"
      end
    end
  end
end
