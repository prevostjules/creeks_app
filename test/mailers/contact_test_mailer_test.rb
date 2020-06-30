require 'test_helper'

class ContactTestMailerTest < ActionMailer::TestCase
  test "message_test" do
    mail = ContactTestMailer.message_test
    assert_equal "Message test", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
