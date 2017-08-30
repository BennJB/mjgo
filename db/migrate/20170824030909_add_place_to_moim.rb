class AddPlaceToMoim < ActiveRecord::Migration[5.1]
  def change
    add_column :moims, :place, :string
  end
end
