class AddStandardToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :standard, :integer
  end
end
