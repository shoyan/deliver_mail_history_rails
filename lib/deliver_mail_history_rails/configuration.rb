module DeliverMailHistoryRails
  module Configuration
    VALID_OPTION_KEYS = [:address, :alias]

    DEFAULT_ADDRESS = :DeliverMailHistory
    DEFAULT_COLUMN  = {
      mail_to: :mail_to,
      subject: :subject,
      mail_header: :mail_header,
      mail_body: :mail_body,
      send_date: :send_date }

    attr_accessor(*VALID_OPTION_KEYS)

    class << self
      def address
        @address || DEFAULT_ADDRESS
      end

      def address=(address)
        @address = address
      end

      def alias
        @alias || DEFAULT_COLUMN
      end

      def alias=(a)
        @alias = a
      end

      def configure
        yield self
      end

      def column(name)
        a = self.alias
        a[name] || name
      end

      def reset
        @address = DEFAULT_ADDRESS
        @alias   = DEFAULT_COLUMN
      end
    end
  end
end
