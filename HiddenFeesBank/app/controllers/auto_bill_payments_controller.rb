class AutoBillPaymentsController < ApplicationController
  before_action :set_auto_bill_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_account

  # GET /auto_bill_payments
  # GET /auto_bill_payments.json
  def index
    @auto_bill_payments = @origin_acct.auto_bill_payments.sort {|a,b| a.dateToPay <=> b.dateToPay}
  end

  # GET /auto_bill_payments/1
  # GET /auto_bill_payments/1.json
  def show
  end

  # GET /auto_bill_payments/new
  def new
    @auto_bill_payment = @origin_acct.auto_bill_payments.new
    @businesses = $business_transactions
  end

  # GET /auto_bill_payments/1/edit
  def edit
    @businesses = $business_transactions
  end

  # POST /auto_bill_payments
  # POST /auto_bill_payments.json
  def create
    # check that the client didn't change the account_id
    if params[:auto_bill_payment][:account_id] != @origin_acct.id.to_s
      flash[:notice] = 'You cannot change Origin Account Number'
      redirect_to new_account_auto_bill_payment_path
      return
    end
    @auto_bill_payment = @origin_acct.auto_bill_payments.new(auto_bill_payment_params)

    respond_to do |format|
      if @auto_bill_payment.save
        format.html { redirect_to account_auto_bill_payments_path, notice: 'Auto bill payment was successfully created.' } 
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /auto_bill_payments/1
  # PATCH/PUT /auto_bill_payments/1.json
  def update
      if @auto_bill_payment.update(auto_bill_payment_params)
        redirect_to account_auto_bill_payments_path, notice: 'Auto bill payment was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /auto_bill_payments/1
  # DELETE /auto_bill_payments/1.json
  def destroy
    @auto_bill_payment.destroy
      redirect_to account_auto_bill_payments_url, notice: 'Auto bill payment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_bill_payment
      @auto_bill_payment = AutoBillPayment.find(params[:id])
    end
    
    def set_account
      @origin_acct = Account.find(params[:account_id])
      @accounts = current_user.accounts
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_bill_payment_params
      params.require(:auto_bill_payment).permit( :destinationAcctNumber, :amount, :businessName, :dateToPay, :account_id, :frequency)
    end
end
