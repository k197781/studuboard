class CreatePrvChatrooms < ActiveRecord::Migration
  def change
    create_table :prv_chatrooms do |t|
      t.integer :user_id_1
      t.integer :user_id_2

      t.timestamps null: false
    end
  end
end
