class InternalTransfersController < ApplicationController
  before_action :set_account

  # GET /internal_transfers/new
  def new
    @accounts = current_user.accounts
    @my_other_accounts = @accounts.all - [@account]
    @internal_transfer = @account.internal_transfers.new
  end

  # GET /internal_transfers/1/edit
  def edit
  end

  # POST /internal_transfers
  # POST /internal_transfers.json
  def create
    yikes
    # can delete originAcctNumber from model since account_id takes care of it
    # need to check validity
    @internal_transfer = @account.internal_transfers.new(internal_transfer_params)

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
      params.require(:internal_transfer).permit(:originAcctNumber, :destinationAcctNumber, :amount, :account_id, :internalTransferType)
    end
end
