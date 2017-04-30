class AddTriggerCriteriaToSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_alerts, :trigger_criteria, :integer
  end
end
