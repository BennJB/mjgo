class CreateCookchoices < ActiveRecord::Migration[5.1]
  def change
    create_table :cookchoices do |t|

      t.string :title

      t.timestamps
    end
  end
end
