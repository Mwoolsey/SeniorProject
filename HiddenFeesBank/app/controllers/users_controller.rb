class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    redirect_to user_path(current_user)
  end

  def show
    if current_user.id != @user.id
      sign_out current_user
      redirect_to new_user_session_path
      flash[:notice] = 'You do not have access to that, please sign in again'
      return
    end
    @accounts = current_user.accounts
    current_user.user_accounts.each do |user_acct|
      @accounts.concat(user_acct.account)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
