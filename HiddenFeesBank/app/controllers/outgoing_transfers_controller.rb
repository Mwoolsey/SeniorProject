class OutgoingTransfersController < ApplicationController
  before_action :set_outgoing_transfer, only: [:show, :edit, :update, :destroy]

  # GET /outgoing_transfers
  # GET /outgoing_transfers.json
  def index
    @outgoing_transfers = OutgoingTransfer.all
  end

  # GET /outgoing_transfers/1
  # GET /outgoing_transfers/1.json
  def show
  end

  # GET /outgoing_transfers/new
  def new
    @outgoing_transfer = OutgoingTransfer.new
  end

  # GET /outgoing_transfers/1/edit
  def edit
  end

  # POST /outgoing_transfers
  # POST /outgoing_transfers.json
  def create
    @outgoing_transfer = OutgoingTransfer.new(outgoing_transfer_params)

    respond_to do |format|
      if @outgoing_transfer.save
        format.html { redirect_to @outgoing_transfer, notice: 'Outgoing transfer was successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_transfer }
      else
        format.html { render :new }
        format.json { render json: @outgoing_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outgoing_transfers/1
  # PATCH/PUT /outgoing_transfers/1.json
  def update
    respond_to do |format|
      if @outgoing_transfer.update(outgoing_transfer_params)
        format.html { redirect_to @outgoing_transfer, notice: 'Outgoing transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_transfer }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_transfers/1
  # DELETE /outgoing_transfers/1.json
  def destroy
    @outgoing_transfer.destroy
    respond_to do |format|
      format.html { redirect_to outgoing_transfers_url, notice: 'Outgoing transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing_transfer
      @outgoing_transfer = OutgoingTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_transfer_params
      params.require(:outgoing_transfer).permit(:originAcctNumber, :destinationAcctNumber, :routingNumber, :amount, :account_id)
    end
end
