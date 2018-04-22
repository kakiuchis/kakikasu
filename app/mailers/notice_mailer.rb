class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_inquiry.subject
  #
  default from: ENV['SERVICE_ADDRESS']

  def sendmail_inquiry(inquiry)
    @inquiry = inquiry

    mail to: inquiry.email,
      bcc: User.where(role: "admin").pluck(:email),
      subject: "【#{ENV['SERVICE_NAME']}】お問い合わせありがとうございます！"
  end
end