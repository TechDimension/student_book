class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
