class Conversation < ApplicationRecord
    
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

# 원래는 belongs_to :user 인데, 여기서는 user모델에 있는 두 명에 속해 있어서,
# 각각의 참조키로 디폴트 값인 user_id 가 아닌!! sender_id 와 recipient_id를 참조키로 지정해야 한다.
# foreign_key: :sender_id, recipient_id 를 가지고 올 수 있는 이유는
# conversation migration에 테이블로 이미 두 개 칼럼을 만들어 놓았고,
# 뷰에서 (sender_id: current_user.id, recipient_id: user.id)를 받아올 예정이라서 가능한 것이다.


    has_many :messages, dependent: :destroy  
    # 해당 대화방을 지우면, 그 메세지까지 다 지운다.

    validates_uniqueness_of :sender_id, scope: :recipient_id
    # a validation to ensure that there cannot be two conversations between the same two users
    
    
    # Conversations_controller.rb 에서 Conversation.between( , )을 실행하는 것과 같은 의미를 지닌다.
    # between에 들어있는 메소드는 -> 다음에 나오는 (sender_id, ~~) do 이다.
    #   scope :between, -> (sender_id,recipient_id) do
    #   where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
    #  end

end 