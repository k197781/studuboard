class AddChatroomIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :chatroom_id, :integer
  end
end
