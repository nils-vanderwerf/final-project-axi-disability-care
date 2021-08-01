class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    remove_column :users, :is_carer
  end
end
