require "deliver_mail_history_rails/observer"

module DeliverMailHistoryRails
end

ActionMailer::Base.register_observer(DeliverMailHistoryRails::Observer)
