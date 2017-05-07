class TransactionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :except => [:index]
  before_action :set_account, only: [:index, :create]

  # GET /transactions
  def index
    # check that the current user has access to the transactions page
    if current_user.id != @account.user.id
      flash[:notice] = 'You do not have access to that, please sign in again'
      sign_out current_user
      redirect_to new_user_session_path
    end
    @accounts = current_user.accounts
    @transactions = @account.transactions.sort { |a,b| b.created_at <=> a.created_at }
  end

  # POST /transactions
  def create

    easy = SMSEasy::Client.new

    @transaction = @account.transactions.new({:description => params[:description], :amount => params[:amount], :status => params[:status], :account_id => params[:account_id], :currentBalance => params[:currentBalance], :created_at => params[:created_at]})
    if @transaction.save
      @account.update_attribute :balance, @account.balance + params[:amount].to_f
    else
      return 
    end
    #------------------------------------------------------------------------------
    # Check for any alerts that this transaction should trigger
    #------------------------------------------------------------------------------
    # get only the triggered alerts
    alert_flag = false
    sms_alerts = @account.sms_alerts.select{|alert| alert.alertType == 1}.map{|alert| alert}
    sms_alerts.each do |alert|
      if alert.trigger_criteria == 1 # trigger on less than
	@transaction.amount.abs < alert.trigger_amount ? alert_flag = true : alert_flag = false
      elsif alert.trigger_criteria == 2 # trigger on equal to
	@transaction.amount.abs == alert.trigger_amount ? alert_flag = true : alert_flag = false
      else # trigger on greater than
	@transaction.amount.abs > alert.trigger_amount ? alert_flag = true : alert_flag = false
      end
      if alert_flag
	# mask the Account number
	masked_acct = "XXXX" + @account.id.to_s[5..8]

	description = @transaction.description
	# if the transaction was a debit, format it better for sms
	if description != "Deposit" or !description.include? "Transfer"
	  description = @transaction.description.split
	  description.shift(2)
	  description.delete_at(2)
	  description = description.join(" ")
	end
	easy.deliver(alert.phone.to_s, alert.carrier, " Account alert\nAcct# #{masked_acct}\n#{description}\nAmount: #{@transaction.amount}\nBalance: $#{@account.balance.round(2)}\n")
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction, :account_id).permit(:transactionNumber, :description, :amount, :status, :currentBalance, :created_at)
    end
end
