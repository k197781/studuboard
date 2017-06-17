class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :title
      t.string :subject

      t.timestamps null: false
    end
  end
end
