class AddGroupIdToUserFiles < ActiveRecord::Migration
  def change
    add_column :user_files, :group_id, :integer
  end
end
