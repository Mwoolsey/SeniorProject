class SmsAlertsController < ApplicationController
  before_action :set_sms_alert, only: [:show, :edit, :update, :destroy]
  before_action :set_accounts

  # GET /sms_alerts
  # GET /sms_alerts.json
  def index
    @sms_alerts = @account.sms_alerts
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
    @sms_alert = @account.sms_alerts.new
    set_sms_fields
    if @sms_alert.save
      redirect_to account_sms_alerts_url, notice: 'Sms alert was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /sms_alerts/1
  # PATCH/PUT /sms_alerts/1.json
  def update
    if !set_sms_fields
      return # something did not work right in set_sms_fields which is handled there
    end

    if @sms_alert.save
      redirect_to account_sms_alerts_path, notice: 'Sms alert was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /sms_alerts/1
  # DELETE /sms_alerts/1.json
  def destroy
    @sms_alert.destroy
    redirect_to account_path(@account), notice: 'Sms alert was successfully destroyed.'
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

    def set_sms_fields
      if params[:sms_alert][:alertType] == nil
	flash.alert = 'Please fill in all fields before submitting'
	render :new
	return
      elsif params[:sms_alert][:alertType] == "alertType_1" # Create Triggered Event
	# check that a valid number was added
	if params[:sms_alert][:trigger_amount].to_f < 1
	  flash.alert = 'Please enter a valid Trigger Amount of $1 or more'
	  render :new
	  return
	end
	@sms_alert.alertType = 1;
	@sms_alert.trigger_criteria = params[:sms_alert][:trigger_criteria].to_i
	@sms_alert.trigger_amount = params[:sms_alert][:trigger_amount].to_f
	@sms_alert.frequency = nil

      else # Create Recurring Event
	@sms_alert.alertType = 2;
	@sms_alert.trigger_criteria = nil
	@sms_alert.trigger_amount = nil
	@sms_alert.frequency = params[:sms_alert][:frequency]
	if params[:sms_alert][:frequency].to_i == 1
	  @sms_alert.next_alert = (Date.today + 1.day)
	elsif params[:sms_alert][:frequency].to_i == 2
	  @sms_alert.next_alert = (Date.today + 1.week)
	else
	  @sms_alert.next_alert = Date.today >> 1 # for one month 
	end
      end
      @sms_alert.carrier = params[:sms_alert][:carrier]
      phone_number = SmsAlert.validate_phone(params[:sms_alert][:phone])
      if !phone_number 
	flash.alert = 'Please enter a valid phone number'
	render :new
	return nil
      else
	@sms_alert.phone = phone_number
      end
      return "ok"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_alert_params
      params.require(:sms_alert).permit(:alertType, :frequency, :account_id, :next_alert, :trigger_criteria, :trigger_amount)
    end
end
