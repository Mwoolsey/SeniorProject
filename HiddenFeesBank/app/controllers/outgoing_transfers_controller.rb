class OutgoingTransfersController < ApplicationController
  before_action :set_account

  # GET /outgoing_transfers/new
  def new
    @accounts = current_user.accounts
    @outgoing_transfer = @account.outgoing_transfers.new
  end

  # POST /outgoing_transfers
  # POST /outgoing_transfers.json
  def create
    @outgoing_transfer = OutgoingTransfer.new(outgoing_transfer_params)
    @outgoing_transfer.account_id = @account.id

    if @outgoing_transfer.save
      redirect_to @account, notice: 'Outgoing transfer was successfully created.' 
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
    def outgoing_transfer_params
      params.require(:outgoing_transfer).permit(:originAcctNumber, :destinationAcctNumber, :routingNumber, :amount, :account_id)
    end
end
