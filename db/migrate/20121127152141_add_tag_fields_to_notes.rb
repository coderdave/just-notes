class AddTagFieldsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :tag1, :string
    add_column :notes, :tag2, :string
    add_column :notes, :tag3, :string
  end
end
