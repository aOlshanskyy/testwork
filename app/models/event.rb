# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments, as: :object
end
