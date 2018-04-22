require 'test_helper'

class DeliverMailerTest < ActionMailer::TestCase
  test "announcement" do
    mail = DeliverMailer.announcement
    assert_equal "Announcement", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
