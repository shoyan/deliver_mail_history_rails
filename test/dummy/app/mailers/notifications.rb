class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.welcome.subject
  #
  def welcome
    headers['X-Account-Id'] = '1'
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Welcome"
  end

  def notice
    headers['X-Account-Id'] = '1'
    @greeting = "Notice!"

    mail to: "to@example.org", subject: "Notice"
  end
end
