module DeliverMailHistoryRails
  module Configuration
    VALID_OPTION_KEYS = [:address]

    DEFAULT_ADDRESS = DeliverMailHistory

    attr_accessor(*VALID_OPTION_KEYS)

    def address
      @address || DEFAULT_ADDRESS
    end

    def configure
      yield self
    end
  end
end
