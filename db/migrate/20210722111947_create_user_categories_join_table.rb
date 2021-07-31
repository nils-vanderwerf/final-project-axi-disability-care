class CreateUserCategoriesJoinTable < ActiveRecord::Migration[6.1]
  def change
      create_table :user_categories do |t|
      t.references :category
      t.references :user

      t.timestamps null: false
    end
  end
end
