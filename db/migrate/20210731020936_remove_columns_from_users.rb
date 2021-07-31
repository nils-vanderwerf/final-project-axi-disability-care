class RemoveColumnsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :is_carer, :string
    remove_column :users, :hourly_rate, :string
  end
end
