class Article < ApplicationRecord
	belongs_to :group
	belongs_to :user
	has_many :articlescoments
end
