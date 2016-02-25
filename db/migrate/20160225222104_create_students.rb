class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :forename
      t.string :surname
      t.string :grade_predicted

      t.timestamps null: false
    end
  end
end
