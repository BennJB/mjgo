class ChatChannel < ApplicationCable::Channel
  
  # 서버단 
  def subscribed
    # stream_from "a"
    current_user.conversations.each do |conversation|
    stream_from "room_#{conversation.id}"
    end
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
