class CreateCooklists < ActiveRecord::Migration[5.1]
  def change
    create_table :cooklists do |t|

      t.string :title

      t.timestamps
    end
  end
end
