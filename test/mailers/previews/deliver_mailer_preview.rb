# Preview all emails at http://localhost:3000/rails/mailers/deliver_mailer
class DeliverMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/deliver_mailer/announcement
  def announcement
    DeliverMailer.announcement
  end

end
