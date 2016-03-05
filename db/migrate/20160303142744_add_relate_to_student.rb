class AddRelateToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :classes, index: true, foreign_key: true
  end
end
