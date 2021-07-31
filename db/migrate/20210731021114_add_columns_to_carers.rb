class AddColumnsToCarers < ActiveRecord::Migration[6.1]
  def change
    add_column :carers, :first_aid_training, :boolean, default: false
    add_column :carers, :hourly_rate, :integer, default: 15
    add_column :carers, :has_vehicle, :boolean, default: false
    add_column :carers, :carer_number, :integer
  end
end
