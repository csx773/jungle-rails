class CreateUsertests < ActiveRecord::Migration
  def change
    create_table :usertests do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps null: false
    end
  end
end
