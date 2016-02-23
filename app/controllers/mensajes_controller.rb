class MensajesController < ApplicationController
    def new
        @message = Mensaje.new
    end
    
    def create
        @message = Mensaje.new(message_params)
        
        if @message.valid?
            MensajeMailer.message_me(@message).deliver_now
            redirect_to contactenos_path, notice: "Thank you for your message."
        else
            redirect_to contactenos_path
        end
    end
    
    private
    def message_params
        params.require(:mensaje).permit(:name, :email, :subject, :content)
    end
end