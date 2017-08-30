class CreateSellings < ActiveRecord::Migration[5.1]
  def change
    create_table :sellings do |t|

      t.string :title

      t.timestamps
    end
  end
end
