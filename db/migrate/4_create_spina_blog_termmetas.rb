class CreateSpinaBlogTermmetas < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_blog_termmetas do |t|
      t.string :meta_key
      t.text :meta_value
      t.references :term, foreign_key: { to_table: :spina_blog_terms }
    end
  end
end
