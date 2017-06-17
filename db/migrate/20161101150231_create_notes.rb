class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :studentType
      t.string :subject

      t.timestamps null: false
    end
  end
end
