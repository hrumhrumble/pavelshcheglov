class StatMailer < ApplicationMailer

  default from: "info@pavelshcheglov.com"
  layout 'mailer'

  def daily_stat_info(mail)
    @sites = Site.all
    mail(to: mail, subject: 'Статистика')
  end

end
