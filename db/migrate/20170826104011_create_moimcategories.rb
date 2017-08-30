class CreateMoimcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :moimcategories do |t|
      
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
