class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :address do |t|
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
