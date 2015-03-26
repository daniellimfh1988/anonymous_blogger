class CreatePosttags < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.timestamps null: false
    end

    create_table :posts do |t|
      t.string :title, :null => false
      t.string :body, :null => false
      t.integer :user_id
      t.timestamps null: false
    end

    create_table :tags do |t|
      t.string :name, :null => false
      t.timestamps null: false

    end

    create_table :post_tags do |t|
      t.integer :post_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end