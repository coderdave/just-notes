class AddTotalAmountToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :total_amount, :decimal
  end
end
