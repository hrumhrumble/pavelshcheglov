namespace :mail do

  desc 'sent test email to p.scheglov@gmail.com'
  task :me => :environment do
    StatMailer.daily_stat_info.deliver_later
  end

end

