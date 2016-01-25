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

    def filter
      yield self
    end

    def subject(*str)
      @@subject = str
    end

    def body(*str)
      @@body = str
    end

    def register?(mail)
      @@subject.each do |s|
        case s.class.to_s
        when Regexp.to_s
          return true if mail.subject.match(s)
        else
          return true if mail.subject == s
        end
      end

      @@body.each do |s|
        case s.class.to_s
        when Regexp.to_s
          return true if mail.body.match(s)
        else
          return true if mail.body == s
        end
      end
      return false
    end
  end
end
