class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    # need to get only the current users accounts
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    # check that the current user has access to the account page
    if current_user.id != @account.user.id
      flash[:notice] = 'You do not have access to that, please sign in again'
      sign_out current_user
      redirect_to new_user_session_path
    end
    @accounts = current_user.accounts
    @transactions = @account.transactionSummary.reverse
    @auto_payment = @account.auto_bill_payments.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:acctNumber, :balance, :acctType)
    end
end
