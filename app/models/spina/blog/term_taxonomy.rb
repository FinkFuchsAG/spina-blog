# frozen_string_literal: true

module Spina
  module Blog
    # Spina::Blog::Post
    class TermTaxonomy < ApplicationRecord
      #extend FriendlyId

      #friendly_id :title, use: :slugged

      belongs_to :term
      #has_many :term_relationships
      has_and_belongs_to_many :posts, join_table: 'spina_blog_term_relationships'

      scope :categories, -> {where(taxonomy: 'category')}



    end
  end
end
