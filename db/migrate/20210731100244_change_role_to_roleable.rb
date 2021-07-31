class ChangeRoleToRoleable < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role_id, :roleable_id
  end
end
