# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments, as: :object
end
