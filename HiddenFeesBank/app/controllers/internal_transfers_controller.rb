class InternalTransfersController < ApplicationController
  before_action :set_account

  # GET /internal_transfers/new
  def new
    @accounts = current_user.accounts
    @my_other_accounts = @accounts.all - [@account]
    @internal_transfer = @account.internal_transfers.new
  end

  # POST /internal_transfers
  # POST /internal_transfers.json
  def create

    if params[:internalTransferType] == 'internalTransferType_1' # transfer to one of my accounts
      destinationAcctNumber = params[:internal_transfer][:myAccountNumber]
    else
      destinationAcctNumber = params[:internal_transfer][:destinationAcctNumber]
      # check that account exists
      if !Account.exists?(destinationAcctNumber)
	redirect_to controller: 'internal_transfers', action: 'new', account_id: @account.id, alert: "Could not locate Account Number: #{destinationAcctNumber}"
	return
      end
    end
    amount = params[:internal_transfer][:amount]
    @internal_transfer = @account.internal_transfers.new ({
      :destinationAcctNumber => destinationAcctNumber,
      :amount => amount,
      :account_id => @account.id
    })

    if @internal_transfer.save
      redirect_to @account, notice: 'Transfer was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_transfer_params
      params.require(:internal_transfer).permit(:myAccountNumber, :destinationAcctNumber, :amount, :account_id, :internalTransferType)
    end
end
