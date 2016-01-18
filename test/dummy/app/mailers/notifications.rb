class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Welcome"
  end
end
