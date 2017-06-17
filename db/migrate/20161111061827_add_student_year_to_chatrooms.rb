class AddStudentYearToChatrooms < ActiveRecord::Migration
  def change
    add_column :chatrooms, :studentYear, :integer
  end
end
