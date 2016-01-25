module DeliverMailHistoryRails
  module Configuration
    def configure
      yield self
    end

    def register_observer(*observers)
      observers.each do |observer|
        ActionMailer::Base.register_observer(observer)
      end
    end
  end
end
