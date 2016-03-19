class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :mail
      t.string :pseudo
      t.timestamps
    end
  end
end
