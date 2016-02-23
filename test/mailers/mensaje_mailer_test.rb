require 'test_helper'

class MensajeMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "message me" do
        msg = Mensaje.new(
            name: 'cornholio',
            email: 'cornholio@example.com',
            subject: 'Hi',
            content: 'Hello from the internet'
            )
        email = MensajeMailer.message_me(msg).deliver_now
        
        refute ActionMailer::Base.deliveries.empty?
        
        assert_equal ['gabrielpinango1492@gmail.com'], email.to
        assert_equal ['cornholio@example.com'], email.from
        assert_equal 'Hi', email.subject
        assert_equal 'Hello from the internet', email.body.to_s
    end
end
