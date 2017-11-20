class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string "email", :limit => 50, :null => false
      t.string "firstname", :limit => 50, :null => false
      t.string "lastname", :limit => 50, :null => false
      t.string "password", :limit => 10, :null => false
      t.timestamps null: false
    end
  end
 
  def down
     drop_table :users 
  end
   
end
