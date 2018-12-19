# frozen_string_literal: true

module Spina
  module Blog
    # Spina::Blog::Post
    class Post < ApplicationRecord
      extend FriendlyId

      friendly_id :title, use: :slugged

      belongs_to :image, optional: true, class_name: 'Spina::Image'

      belongs_to :user
      has_and_belongs_to_many :categories, -> {
        where("taxonomy = ?", 'category')
      }, join_table: 'spina_blog_term_relationships', class_name: 'TermTaxonomy'


      validates :title, :content, presence: true

      before_save :set_published_at

      # Create a 301 redirect if the slug changed
      after_save :rewrite_rule, if: -> {saved_change_to_slug?}, on: :update

      default_scope {where(post_type: 'post')}
      scope :available, -> {where('published_at <= ?', Time.zone.now)}
      scope :future, -> {where('published_at >= ?', Time.zone.now)}
      scope :draft, -> {where(status: 'draft')}
      scope :live, -> {where(status: 'publish')}

      def draft?
        status.eql?('draft')
      end

      def draft_changed?
        status_changed?
      end

      private

      def set_published_at
        self.published_at = Time.now if !draft? && published_at.blank?
      end

      def should_generate_new_friendly_id?
        slug.blank? || draft_changed? || super
      end

      def rewrite_rule
        ::Spina::RewriteRule.create(
            old_path: "/blog/posts/#{slug_before_last_save}",
            new_path: "/blog/posts/#{slug}"
        )
      end
    end
  end
end
