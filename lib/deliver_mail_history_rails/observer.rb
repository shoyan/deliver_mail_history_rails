module DeliverMailHistoryRails
  class Observer
    def self.delivered_email(mail)
      address = Configuration.address.to_s
      eval(address).new(
        Configuration.column(:mail_to) => mail.to,
        Configuration.column(:mail_subject) => mail.subject,
        Configuration.column(:mail_header) => mail.header.to_s,
        Configuration.column(:mail_body) => mail.decode_body,
        Configuration.column(:send_date) => mail.date.to_s(:db)
      ).save
    end
  end
end
