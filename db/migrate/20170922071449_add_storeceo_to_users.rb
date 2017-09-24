class AddStoreceoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :storeceo, :boolean, default: false
  end
end
