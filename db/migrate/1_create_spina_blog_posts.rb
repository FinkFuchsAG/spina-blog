class CreateSpinaBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_posts do |t|
      t.string :title
      t.text :excerpt
      t.text :content
      t.references :image, foreign_key: { to_table: :spina_images }
      t.string :status
      t.string :comment_status
      t.datetime :published_at
      t.string :slug, unique: true, index: true
      t.references :user, foreign_key: { to_table: :spina_users }
      t.datetime :modified_at
      t.integer :parent_id
      #t.references :parent, foreign_key: { to_table: :spina_blog_posts }
      t.integer :menu_order
      t.string :post_type
      t.string :mime_type
      t.integer :comment_count
      t.string :ping_status
      t.string :password
      t.text :to_ping
      t.text :pinged

      t.timestamps
    end
  end
end
