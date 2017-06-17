class CreatePrvNotes < ActiveRecord::Migration
  def change
    create_table :prv_notes do |t|
      t.string :content
      t.integer :user_id
      t.integer :prvchatroom_id

      t.timestamps null: false
    end
  end
end
