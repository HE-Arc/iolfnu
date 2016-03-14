class RenameColumnPhotoTableBodyToDescription < ActiveRecord::Migration
  def change
    rename_column :photos, :body, :description
  end
end
