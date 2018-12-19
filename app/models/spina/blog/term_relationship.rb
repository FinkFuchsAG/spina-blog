# frozen_string_literal: true

module Spina
  module Blog
    # Spina::Blog::Post
    class TermRelationship < ApplicationRecord
      #extend FriendlyId

      #friendly_id :title, use: :slugged


      has_many :posts
      has_many :term_taxonomies

    end
  end
end
