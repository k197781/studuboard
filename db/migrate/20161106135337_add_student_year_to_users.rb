class AddStudentYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studentYear, :integer
  end
end
