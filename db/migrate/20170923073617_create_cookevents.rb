class CreateCookevents < ActiveRecord::Migration[5.1]
  def change
    create_table :cookevents do |t|
      
      t.string :title
      t.string :image

      t.integer :cook_id
      t.integer :user_id

      t.timestamps
    end
  end
end
