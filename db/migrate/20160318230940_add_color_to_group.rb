class AddColorToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :color_t, :string
  end
end
