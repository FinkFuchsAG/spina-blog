# frozen_string_literal: true

class CreateSpinaBlogTermRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_term_relationships do |t|
      t.references :post, foreign_key: { to_table: :spina_blog_posts }
      t.references :term_taxonomy, foreign_key: { to_table: :spina_blog_term_taxonomies }
      t.integer :term_order

    end
  end
end

