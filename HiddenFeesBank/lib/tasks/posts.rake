namespace :posts do
  desc "Delete records older than 60 days"
  task delete_60_days_old: :environment do
    Transaction.where(['created_at < ?', 60.days.ago]).destroy_all
  end
end
