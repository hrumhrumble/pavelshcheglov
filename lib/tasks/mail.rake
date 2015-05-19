namespace :mail do

  desc 'sent test email to p.scheglov@gmail.com'
  task :me => :environment do
    mail = "p.scheglov@gmail.com"
    StatMailer.daily_stat_info(mail).deliver_later
  end

end

