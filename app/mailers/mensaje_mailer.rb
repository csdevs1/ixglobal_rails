class MensajeMailer < ApplicationMailer
    default :to => "ixglobalservice@gmail.com"
    def message_me(msg)
        @msg = msg
        
        mail from: @msg.email, subject: @msg.subject, body: "De: " + @msg.email + "\n\n" + @msg.content
    end
end
