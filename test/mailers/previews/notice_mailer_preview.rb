# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice_mailer/sendmail_inquiry
  def sendmail_inquiry
    NoticeMailer.sendmail_inquiry
  end

end
