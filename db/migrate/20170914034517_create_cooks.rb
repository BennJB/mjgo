class CreateCooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cooks do |t|

      t.string :title
      t.text :content
      
      t.text :address
      t.string :phone
      t.string :opertime
      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10
      
      t.string :menuone
      t.string :menutwo
      t.string :menuthr
      t.string :menufour
      t.string :menufive
      
      t.string :one
      t.string :two
      t.string :thr
      t.string :four
      t.string :five
      
      t.text :image     
      
      t.integer :cookchoice_id
      t.integer :cooklist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
