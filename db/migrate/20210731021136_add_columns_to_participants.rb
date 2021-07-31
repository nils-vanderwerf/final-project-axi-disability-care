class AddColumnsToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :ndis, :boolean, default: false
    add_column :participants, :ndis_number, :integer
    add_column :participants, :disability, :text
  end
end
