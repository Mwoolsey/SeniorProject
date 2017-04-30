class AddNextAlertToSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_alerts, :next_alert, :datetime
  end
end
