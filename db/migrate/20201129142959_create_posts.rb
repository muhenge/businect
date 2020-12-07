class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
      # add_index :posts, [:user_id, :created_at]
      # add_index :posts, [:comment_id, :created_at]

      #Ex:- add_index("admin_users", "username")
    end
  end
end
