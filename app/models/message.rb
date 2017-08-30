class Message < ActiveRecord::Base
  
  belongs_to :conversation
  belongs_to :user
                       # body는 메세지 내용
  validates_presence_of :body, :conversation_id, :user_id

end