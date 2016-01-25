class CustomObserver < DeliverMailHistoryRails::Observer
  def self.delivered_email(mail)
    MailHistory.new(
      email_to: mail.to,
      email_title: mail.subject,
      email_header: mail.header.to_s,
      email_body: mail.decode_body,
      notify_date: mail.date.to_s(:db)
    ).save
  end
end

DeliverMailHistoryRails.configure do |config|
  config.register_observer DeliverMailHistoryRails::Observer, CustomObserver
  config.filter do |f|
    f.subject(/.*/)
    f.body(/.*/)
  end
end
