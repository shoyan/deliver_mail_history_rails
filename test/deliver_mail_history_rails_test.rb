require 'test_helper'

class DeliverMailHistoryRailsTest < ActiveSupport::TestCase

  test "register_database" do
    mail = Notifications.welcome.deliver_now
    history = DeliverMailHistory.last

    assert_equal mail.to.to_s, history.mail_to
    assert_equal mail.subject, history.mail_subject
    assert_equal mail.header.to_s, history.mail_header
    assert_equal mail.decode_body, history.mail_body
    assert_equal mail.date.to_s(:db), history.send_date

    history = MailHistory.last

    assert_equal mail.to.to_s, history.email_to
    assert_equal mail.subject, history.email_title
    assert_equal mail.header.to_s, history.email_header
    assert_equal mail.decode_body, history.email_body
    assert_equal mail.date.to_s(:db), history.notify_date
    assert_equal mail.header['X-Account-Id'].value, history.account_id
  end

  # test "not_register_database" do
  #   Notifications.notice.deliver_now
  #   history = DeliverMailHistory.last
  #
  #   assert_equal history, []
  # end
end
