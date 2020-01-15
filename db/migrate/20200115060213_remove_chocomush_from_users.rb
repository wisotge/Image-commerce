class RemoveChocomushFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :chocomush
  end
end
