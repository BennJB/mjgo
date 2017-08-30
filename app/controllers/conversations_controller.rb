class ConversationsController < ApplicationController
 
    before_action :authenticate_user!
        
    def index
    @users = User.all
    @conversations = Conversation.all
    end
    
    def create
        if Conversation.where("(conversations.sender_id =? AND conversations.recipient_id =?) OR (conversations.sender_id =? AND conversations.recipient_id =?)", params[:sender_id], params[:recipient_id], params[:recipient_id], params[:sender_id]).present?
        @conversation = Conversation.where("(conversations.sender_id =? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", params[:sender_id], params[:recipient_id], params[:recipient_id], params[:sender_id]).first
        else
        @conversation = Conversation.create!(conversation_params)
        end
    redirect_to conversation_messages_path(@conversation)
    end

    private
        def conversation_params
        params.permit(:sender_id, :recipient_id)
        end
    end