class CreateCookreplies < ActiveRecord::Migration[5.1]
  def change
    create_table :cookreplies do |t|
  
      t.string :content
      t.string :rating
      
      t.integer :cook_id
      t.integer :user_id


      t.timestamps
    end
  end
end
