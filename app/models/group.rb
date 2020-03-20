class Group < ApplicationRecord
	belongs_to :user
	has_many :articles
	has_many :enters
	# has_many :articlescoments
	has_many :events
	has_many :candidates
end
