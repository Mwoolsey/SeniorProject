class InternalTransfersController < ApplicationController
  before_action :set_internal_transfer, only: [:show, :edit, :update, :destroy]

  # GET /internal_transfers
  # GET /internal_transfers.json
  def index
    @internal_transfers = InternalTransfer.all
  end

  # GET /internal_transfers/1
  # GET /internal_transfers/1.json
  def show
  end

  # GET /internal_transfers/new
  def new
    @internal_transfer = InternalTransfer.new
  end

  # GET /internal_transfers/1/edit
  def edit
  end

  # POST /internal_transfers
  # POST /internal_transfers.json
  def create
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

  # PATCH/PUT /internal_transfers/1
  # PATCH/PUT /internal_transfers/1.json
  def update
    respond_to do |format|
      if @internal_transfer.update(internal_transfer_params)
        format.html { redirect_to @internal_transfer, notice: 'Internal transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_transfer }
      else
        format.html { render :edit }
        format.json { render json: @internal_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_transfers/1
  # DELETE /internal_transfers/1.json
  def destroy
    @internal_transfer.destroy
    respond_to do |format|
      format.html { redirect_to internal_transfers_url, notice: 'Internal transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_transfer
      @internal_transfer = InternalTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_transfer_params
      params.require(:internal_transfer).permit(:originAcctNumber, :destinationAcctNumber, :amount, :account_id)
    end
end
