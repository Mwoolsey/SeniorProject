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

    #easy = SMSEasy::Client.new
    #easy.deliver("5305929957", "at&t", "It worked!!!!!")

    @transaction = @account.transactions.new({:description => params[:description], :amount => params[:amount], :status => params[:status], :account_id => params[:account_id], :currentBalance => params[:currentBalance], :created_at => params[:created_at]})
    if @transaction.save
      @account.update_attribute :balance, @account.balance + params[:amount].to_f
    else
      puts "Error saving transaction"
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
