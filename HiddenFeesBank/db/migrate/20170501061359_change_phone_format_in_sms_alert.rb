class ChangePhoneFormatInSmsAlert < ActiveRecord::Migration[5.0]
  def up
    change_column :sms_alerts, :phone, :integer, :limit => 10
  end

  def down
    change_column :sms_alerts, :phone, :integer, :limit => 4
  end
end
