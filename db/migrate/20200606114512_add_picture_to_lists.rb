class AddPictureToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :picture, :string
  end
end
