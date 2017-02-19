json.extract! sms_alert, :id, :alertType, :frequency, :account_id, :created_at, :updated_at
json.url sms_alert_url(sms_alert, format: :json)