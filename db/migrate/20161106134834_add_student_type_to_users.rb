class AddStudentTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studentType, :string
  end
end
