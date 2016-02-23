require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test 'responds to name, email, subject and content' do
        msg = Message.new
        [:name, :email, :subject, :content].each do |attr|
            assert msg.respond_to? attr
        end
    end
    
    test 'should accept valid attributes' do
        valid_attrs = {
            name: 'test',
            email: 'test@example.com',
            subject: 'hi',
            content: 'fkjdsnkl'
            }
        msg = Message.new valid_attrs
        
        assert msg.valid?
    end
    
    test 'attributes can not be blank' do
        msg = Message.new
        refute mesg.valid?
    end
end
