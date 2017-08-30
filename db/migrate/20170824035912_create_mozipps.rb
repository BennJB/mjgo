class CreateMozipps < ActiveRecord::Migration[5.1]
  def change
    create_table :mozipps do |t|
      
      t.string :title

      t.timestamps
    end
  end
end
