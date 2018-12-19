# frozen_string_literal: true

class CreateSpinaBlogCommentmetas < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_commentmetas do |t|
      t.references :comment, foreign_key: {to_table: :spina_blog_comments}

      t.string :meta_key
      t.text :meta_value

    end
  end
end

