class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      
      # the sole responsibility of the conversation is 
      # to keep track of the two users involved
      
      # 결국 sender_id & recipient_id는 user 모델에 속한 user 2명을 새롭게 정의한 것이다.
      # 그래서 Conversations(2명만 들어올 수 있는 대기실) user 2명에 속한 것이 된다.
      # t.integer :user_id 하게 되면, 1명만 참여하는 것이므로 의미가 없다.
      
      # post로 예를 들면!!!
      # 하나의 [ post(게시글), 여기서는 conversations ] 의 주인이 2명인 셈인 것이다.
      
      # t.belongs_to(=t.references) :sender
      t.integer :sender_id
      t.integer :recipient_id
      
      t.timestamps
    end
  end
end
