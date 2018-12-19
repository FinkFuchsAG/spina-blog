# frozen_string_literal: true

class CreateSpinaBlogComments < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_comments do |t|
      t.references :user, foreign_key: { to_table: :spina_users }
      t.references :post, foreign_key: { to_table: :spina_blog_posts }

      t.text :author
      t.string :author_email
      t.string :author_url
      t.string :author_ip
      t.text :content
      t.integer :karma
      t.string :approved
      t.string :agent
      t.string :comment_type
      t.integer :parent_id
      #t.references :parent, foreign_key: { to_table: :spina_blog_comments }

      t.timestamps
    end
  end
end

