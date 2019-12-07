
class AddChocomushToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :chocomush, :integer
  end
end
