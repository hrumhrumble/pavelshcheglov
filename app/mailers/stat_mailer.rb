class StatMailer < ApplicationMailer

  default from: "stat@pavelshcheglov.com"
  layout 'mailer'

  def daily_stat_info
    @sites = Site.all
    mail(to: "p.scheglov@gmail.com", subject: 'Статистика')
  end

end
