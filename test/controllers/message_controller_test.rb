require 'test_helper'

class MessageControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
    
    test 'successful post' do
        post :create, message: {
            name: 'cornholio',
            email: 'corhnholio@example.com',
            subject: 'hi',
            content: 'bai'
            }
        assert_redirected_to new_message_path
    end
    
    test 'failed post' do
        post :create, message: {\
                name: '',
            email: '',
            subject: '',
            content ''
            }
        [:name, :email, :subject, :content].each do |attr|
            assert_select 'li', "#{attr.capitalize} can't be blank"
        end
    end
    
    test "successful post" do
        assert_difference 'ActionMailer:Base.deliveries.size', 1 do
            post :create, message: {
                name: 'cornholio',
                email: 'cornholio@example.com',
                subject: 'hi',
                content: 'bai'
                }
        end
        
        asstert_redirected_to new_message_path
        last_email = ActionMailer::Base.deliveries.last
        
        assert_equal "hi", last_email.subject
        assert_equal 'stephen@example.com', last_email.to[0]
        assert_equal 'cornholio@example.com', last_email.from[0]
        assert_match(/bai/, last_email.body.to_s)
        
        ActionMailer::Base.deliveries.clear
    end

end
