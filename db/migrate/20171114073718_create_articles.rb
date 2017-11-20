class CreateArticles < ActiveRecord::Migration[5.1]
  def up
    create_table :articles do |t|
      t.text "content", :limit => 2147483647, :null => false
      t.string "title", :limit => 100, :null => false
      t.string "language", :limit => 20, :null => false
      t.integer "user_id", :null => false
      t.timestamps null: false
    end
  end

  def down
     drop_table :articles
  end

end
