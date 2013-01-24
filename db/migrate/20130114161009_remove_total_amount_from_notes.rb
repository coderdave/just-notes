class RemoveTotalAmountFromNotes < ActiveRecord::Migration
  def up
    remove_column :notes, :total_amount
  end

  def down
    add_column :notes, :total_amount, :decimal
  end
end
