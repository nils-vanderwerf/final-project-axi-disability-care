class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :profile_picture
      t.text :bio
      t.integer :age
      t.string :gender
      t.integer :zip_code
      
      t.string :available_hours
      t.integer :hourly_rate, default: 50
      t.boolean :is_carer, default: true
      t.belongs_to :address


      t.timestamps
    end
  end
end
