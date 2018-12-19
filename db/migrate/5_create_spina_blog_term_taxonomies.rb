# frozen_string_literal: true

class CreateSpinaBlogTermTaxonomies < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_term_taxonomies do |t|
      t.references :term, foreign_key: { to_table: :spina_blog_terms }
      t.string :taxonomy
      t.text :description
      t.integer :parent_id
      #t.references :parent, foreign_key: { to_table: :spina_blog_term_taxonomy }
      t.integer :count
    end
  end
end

