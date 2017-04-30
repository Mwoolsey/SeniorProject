class SmsAlertsController < ApplicationController
  before_action :set_sms_alert, only: [:show, :edit, :update, :destroy]
  before_action :set_accounts

  # GET /sms_alerts
  # GET /sms_alerts.json
  def index
    @sms_alerts = @account.sms_alerts
  end

  # GET /sms_alerts/1
  # GET /sms_alerts/1.json
  def show
  end

  # GET /sms_alerts/new
  def new
    @sms_alert = @account.sms_alerts.new
  end

  # GET /sms_alerts/1/edit
  def edit
  end

  # POST /sms_alerts
  # POST /sms_alerts.json
  def create
    @sms_alert = SmsAlert.new(sms_alert_params)

    respond_to do |format|
      if @sms_alert.save
        format.html { redirect_to @sms_alert, notice: 'Sms alert was successfully created.' }
        format.json { render :show, status: :created, location: @sms_alert }
      else
        format.html { render :new }
        format.json { render json: @sms_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms_alerts/1
  # PATCH/PUT /sms_alerts/1.json
  def update
    respond_to do |format|
      if @sms_alert.update(sms_alert_params)
        format.html { redirect_to @sms_alert, notice: 'Sms alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @sms_alert }
      else
        format.html { render :edit }
        format.json { render json: @sms_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_alerts/1
  # DELETE /sms_alerts/1.json
  def destroy
    @sms_alert.destroy
    respond_to do |format|
      format.html { redirect_to sms_alerts_url, notice: 'Sms alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sms_alert
      @sms_alert = SmsAlert.find(params[:id])
    end

    def set_accounts
      @accounts = current_user.accounts
      @account = Account.find(params[:account_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_alert_params
      params.require(:sms_alert).permit(:alertType, :frequency, :account_id, :next_alert, :trigger_criteria, :trigger_amount)
    end
end
