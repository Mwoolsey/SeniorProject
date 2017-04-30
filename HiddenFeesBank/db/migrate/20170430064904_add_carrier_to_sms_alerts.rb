class AddCarrierToSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_alerts, :carrier, :string
  end
end
