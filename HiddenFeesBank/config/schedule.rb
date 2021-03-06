# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"} 
every 4.minutes do
  rake "transactions:debit"
end
=begin
=end

every 5.minutes do
  rake "transactions:credit"
end

every 1.day :at => '8am' do
  rake "auto_payments:run"
end

every 1.hour do
  rake "posts:delete_60_days_old"
end

every 1.minute do
  rake "internal_transfers:run"
end

every 5.minute do
  rake "outgoing_transfers:run"
end

