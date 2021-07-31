class AddUserReferenceToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_reference :participants, :user, index: true
  end
end
