class AddTriggerAmountToSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_alerts, :trigger_amount, :decimal
  end
end
