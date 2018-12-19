# frozen_string_literal: true

module Spina
  module Blog
    # Spina::Blog::Post
    class Term < ApplicationRecord
      #extend FriendlyId

      #friendly_id :title, use: :slugged


      belongs_to :termmeta
      has_many :term_taxonomies

    end
  end
end
