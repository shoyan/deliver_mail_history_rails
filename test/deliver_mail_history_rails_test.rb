require 'test_helper'

class DeliverMailHistoryRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, DeliverMailHistoryRails
  end

  def test_send_mail_when_register_database
    mail = Notifications.welcome.deliver_now
    history = DeliverMailHistory.last

    assert_equal mail.to.to_s, history.mail_to
    assert_equal mail.subject, history.mail_subject
    assert_equal mail.header.to_s, history.mail_header
    assert_equal mail.decode_body, history.mail_body
    assert_equal mail.date.to_s(:db), history.send_date
  end
end
