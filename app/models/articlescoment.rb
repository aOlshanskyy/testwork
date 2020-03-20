class Articlescoment < ApplicationRecord
	belongs_to :article
	# belongs_to :group 
	belongs_to :user 
end
