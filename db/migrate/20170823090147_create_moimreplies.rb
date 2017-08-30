class CreateMoimreplies < ActiveRecord::Migration[5.1]
  def change
    create_table :moimreplies do |t|

      t.string :content
      t.integer :moim_id
      t.integer :user_id

      t.timestamps
    end
  end
end
