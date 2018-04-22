class DeliverMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.deliver_mailer.announcement.subject
  #
  default from: "noreply@kakikasu.herokuapp.com"

  def announcement(announcement)
    @announcement = announcement

    mail to: "noreply@kakikasu.herokuapp.com",
      bcc: User.pluck(:email),
      subject: announcement.title
  end
end
