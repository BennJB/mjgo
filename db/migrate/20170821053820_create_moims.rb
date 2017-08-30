class CreateMoims < ActiveRecord::Migration[5.1]
  def change
    create_table :moims do |t|
      
      t.string :title
      t.integer :person
      t.text :content
      t.string :image
    
      t.integer :mozip_id
      t.integer :moimcategory_id
    # [t.belongs_to :user] == [t.references :user]
      t.integer :user_id

      t.timestamps
    end
  end
end
