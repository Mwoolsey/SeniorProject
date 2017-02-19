class AutoBillPaymentsController < ApplicationController
  before_action :set_auto_bill_payment, only: [:show, :edit, :update, :destroy]

  # GET /auto_bill_payments
  # GET /auto_bill_payments.json
  def index
    @auto_bill_payments = AutoBillPayment.all
  end

  # GET /auto_bill_payments/1
  # GET /auto_bill_payments/1.json
  def show
  end

  # GET /auto_bill_payments/new
  def new
    @auto_bill_payment = AutoBillPayment.new
  end

  # GET /auto_bill_payments/1/edit
  def edit
  end

  # POST /auto_bill_payments
  # POST /auto_bill_payments.json
  def create
    @auto_bill_payment = AutoBillPayment.new(auto_bill_payment_params)

    respond_to do |format|
      if @auto_bill_payment.save
        format.html { redirect_to @auto_bill_payment, notice: 'Auto bill payment was successfully created.' }
        format.json { render :show, status: :created, location: @auto_bill_payment }
      else
        format.html { render :new }
        format.json { render json: @auto_bill_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_bill_payments/1
  # PATCH/PUT /auto_bill_payments/1.json
  def update
    respond_to do |format|
      if @auto_bill_payment.update(auto_bill_payment_params)
        format.html { redirect_to @auto_bill_payment, notice: 'Auto bill payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto_bill_payment }
      else
        format.html { render :edit }
        format.json { render json: @auto_bill_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_bill_payments/1
  # DELETE /auto_bill_payments/1.json
  def destroy
    @auto_bill_payment.destroy
    respond_to do |format|
      format.html { redirect_to auto_bill_payments_url, notice: 'Auto bill payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_bill_payment
      @auto_bill_payment = AutoBillPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_bill_payment_params
      params.require(:auto_bill_payment).permit(:originAcctNumber, :destinationAcctNumber, :amount, :businessName, :businessAddress, :dateToPay, :account_id)
    end
end
