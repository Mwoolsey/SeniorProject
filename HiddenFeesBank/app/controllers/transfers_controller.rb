class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:new]

  # GET /transfers/new
  def new
    @current_user = User.find(params[:current_user])
    @accounts = @current_user.accounts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.fetch(:transfer, :account_id, :current_user).permit(:account_id, :current_user)
    end
end
