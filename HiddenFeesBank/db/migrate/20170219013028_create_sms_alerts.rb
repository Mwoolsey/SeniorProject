class CreateSmsAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_alerts do |t|
      t.integer :alertType
      t.integer :frequency
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
