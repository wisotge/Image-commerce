class AddDefaultvalChocomushToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :chocomush, :integer, default: 0
  end
end
