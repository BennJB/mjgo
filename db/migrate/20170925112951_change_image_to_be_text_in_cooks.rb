class ChangeImageToBeTextInCooks < ActiveRecord::Migration[5.1]
  def change
    change_column :cooks, :image, :text
  end
end
