class ContactTestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_test_mailer.message_test.subject
  #
  def message_test
    @contact = params[:contact]
    mail(to: "contact@creeks.app", subject: 'Prise de contact', from: @contact.email)
  end
end
