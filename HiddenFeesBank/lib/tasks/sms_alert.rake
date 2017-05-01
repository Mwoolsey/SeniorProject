namespace :sms_alert do
  desc "Rake task to handle automatic bill payments"
  task :run => :environment do

    # only get the alerts that are Recurring
    @sms_alerts = SmsAlert.all.select{ |alert| alert.alertType == 2 }.map{ |alert| alert }

    easy = SMSEasy::Client.new

    @sms_alerts.each do |alert|
      if alert.next_alert.to_time == Date.today.to_time
	easy.deliver(alert.phone.to_s, alert.carrier, "Account: #{alert.account.id}\nCurrent Balance: #{alert.account.balance}")
      end
    end

  end
end
