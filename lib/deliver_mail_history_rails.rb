require "deliver_mail_history_rails/configuration"
require "deliver_mail_history_rails/observer"

module DeliverMailHistoryRails
  extend Configuration
end

ActionMailer::Base.register_observer(DeliverMailHistoryRails::Observer)
