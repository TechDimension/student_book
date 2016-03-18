class AddRelateToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :group, index: true, foreign_key: true
  end
end
