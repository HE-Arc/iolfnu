class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.attachment :image
      t.integer :album_id

      t.timestamps null: false
    end
  end
end
