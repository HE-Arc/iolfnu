class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :label
    end
  end
end
