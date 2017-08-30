class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      
      t.text :body
      
      # user 모델에서 2명을 참조(t.references :user)해왔기 떄문에,
      # 누가 대화하는지 알 수 있지만, 방을 만들어 주지 않으면 공개된 복도에서 이야기 하는 것과 같다. 
      # 그래서 이 2명의 아이들이 속한 방 또한 참조해와야 한다.(t.references :conversation)
      
      # Messages를 replies로 생각하면 편하다.
      # 어떤 게시글(post)에 누가(user) 쓴 replies 인지랑 똑같다.
      # 어떤 채팅방(conversation)에서 누가(user-여기서는 두 명) 쓴 messages 인지.  
      
      t.references :user, index: true
      t.references :conversation, index: true
      t.boolean :read, default: false
      
      t.timestamps
    end
  end
end
