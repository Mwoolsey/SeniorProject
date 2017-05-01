class AddPhoneToSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_alerts, :phone, :string
  end
end
