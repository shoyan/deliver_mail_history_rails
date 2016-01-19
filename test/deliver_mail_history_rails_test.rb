require 'test_helper'

class DeliverMailHistoryRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, DeliverMailHistoryRails
  end

  def test_send_mail_when_register_database
    DeliverMailHistoryRails::Configuration.reset
    mail = Notifications.welcome.deliver_now
    history = DeliverMailHistory.last

    assert_equal mail.to.to_s, history.mail_to
    assert_equal mail.subject, history.mail_subject
    assert_equal mail.header.to_s, history.mail_header
    assert_equal mail.decode_body, history.mail_body
    assert_equal mail.date.to_s(:db), history.send_date
  end

  def test_send_mail_when_register_configure_table
    DeliverMailHistoryRails::Configuration.configure do |config|
      config.address = :MailHistory
      config.alias = {
        mail_to: :email_to,
        mail_subject: :email_title,
        mail_header: :email_header,
        mail_body: :email_body,
        send_date: :notify_date
      }
    end

    mail = Notifications.welcome.deliver_now
    history = MailHistory.last

    assert_equal mail.to.to_s, history.email_to
    assert_equal mail.subject, history.email_title
    assert_equal mail.header.to_s, history.email_header
    assert_equal mail.decode_body, history.email_body
    assert_equal mail.date.to_s(:db), history.notify_date
  end
end
