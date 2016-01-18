module DeliverMailHistoryRails
  class Observer
    def self.delivered_email(mail)
      DeliverMailHistoryRails.address.new(
        mail_to: mail.to,
        mail_subject: mail.subject,
        mail_header: mail.header.to_s,
        email_body: mail.decode_body,
        send_date: mail.date.to_s(:db)
      ).save
    end
  end
end
