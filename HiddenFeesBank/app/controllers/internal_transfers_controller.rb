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
    @internal_transfer = InternalTransfer.new(internal_transfer_params)

    respond_to do |format|
      if @internal_transfer.save
        format.html { redirect_to @internal_transfer, notice: 'Internal transfer was successfully created.' }
        format.json { render :show, status: :created, location: @internal_transfer }
      else
        format.html { render :new }
        format.json { render json: @internal_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_transfer_params
      params.require(:internal_transfer).permit(:originAcctNumber, :destinationAcctNumber, :amount, :account_id, :myAccountNumber)
    end
end
