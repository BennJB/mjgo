class CreateDongarireplies < ActiveRecord::Migration[5.1]
  def change
    create_table :dongarireplies do |t|
      
      t.string :content
      t.integer :dongari_id
      t.integer :user_id

      t.timestamps
    end
  end
end
