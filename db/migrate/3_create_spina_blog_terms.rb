class CreateSpinaBlogTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_terms do |t|
      t.string :name
      t.string :slug, unique: true, index: true
      t.integer :term_group
    end
  end
end
