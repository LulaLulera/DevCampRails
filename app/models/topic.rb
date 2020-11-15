class Topic < ApplicationRecord
	has_many :blogs #tiene una relación con blogs
	validates_presence_of :title
end
