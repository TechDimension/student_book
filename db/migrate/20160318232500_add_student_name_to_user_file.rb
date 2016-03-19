class AddStudentNameToUserFile < ActiveRecord::Migration
  def change
    add_column :user_files, :student_name, :string
  end
end
