# Preview all emails at http://localhost:3000/rails/mailers/contact_test_mailer
class ContactTestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_test_mailer/message_test
  def message_test
    ContactTestMailer.message_test
  end

end
