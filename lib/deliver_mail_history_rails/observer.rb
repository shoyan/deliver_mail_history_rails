module DeliverMailHistoryRails
  class Observer
    def self.delivered_email(mail)
      DeliverMailHistory.new(
        mail_to: mail.to,
        mail_subject: mail.subject,
        mail_header: mail.header.to_s,
        mail_body: mail.decode_body,
        send_date: mail.date.to_s(:db)
      ).save if DeliverMailHistoryRails.register?(mail)
    end
  end
end
