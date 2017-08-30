class MessagesController < ApplicationController
    
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end
    
    def index
        @messages = @conversation.messages
    
     if @messages.length > 10
        @over_ten = true
        @messages = @messages[-9..-1]
    end
    
    if params[:m]
        @over_ten = false
        @messages = @conversation.messages
    end
 
    if @messages.last
        if @messages.last.user_id != current_user.id
        @messages.last.read = true;
        end
    end
    
        @message = @conversation.messages.new
    end
    
    def new
        @message = @conversation.messages.new
    end
    
     before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end
    
    def create
        message = @conversation.messages.new(message_params)
       
        respond_to do |format|
        if message.save
            ActionCable.server.broadcast "room_#{@conversation.id}",
            body: message.body, 
            message_user: message.user
            # recipient_id: message.conversation.recipient_id
            format.js { head :ok }
            # redirect_to conversation_messages_path(@conversation)
        end
        end
        
    end
    
    private
        def message_params
        params.require(:message).permit(:body, :user_id)
        end
end