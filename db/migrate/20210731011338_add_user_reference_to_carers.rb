class AddUserReferenceToCarers < ActiveRecord::Migration[6.1]
  def change
    add_reference :carers, :user, index: true
  end
end
