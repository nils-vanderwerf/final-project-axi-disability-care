class AddRoleableTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :roleable_type
  end
end
