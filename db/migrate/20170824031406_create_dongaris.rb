class CreateDongaris < ActiveRecord::Migration[5.1]
  def change
    create_table :dongaris do |t|
      
      t.string :title
      t.string :place
      t.integer :person
      t.text :content
      t.string :image
      
      t.integer :mozipp_id
    # [t.belongs_to :user] == [t.references :user]
      t.integer :user_id


      t.timestamps
    end
  end
end
