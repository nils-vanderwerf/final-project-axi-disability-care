class CreateCarers < ActiveRecord::Migration[6.1]
  def change
    create_table :carers do |t|

      t.timestamps
    end
  end
end
