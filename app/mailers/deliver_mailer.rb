class DeliverMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.deliver_mailer.announcement.subject
  #
  default from: ENV['SERVICE_ADDRESS']

  def announcement(announcement)
    @announcement = announcement

    mail to: ENV['SERVICE_ADDRESS'],
      bcc: User.pluck(:email),
      subject: announcement.title
  end
end
