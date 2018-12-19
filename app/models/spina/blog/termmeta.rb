# frozen_string_literal: true

module Spina
  module Blog
    # Spina::Blog::Post
    class Termmeta < ApplicationRecord
      #extend FriendlyId

      #friendly_id :title, use: :slugged

      belongs_to :term

    end
  end
end
