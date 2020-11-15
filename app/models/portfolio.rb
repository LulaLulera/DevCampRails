class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image 

	#un tipo de scope
	def self.angular
		where(subtitle: 'Angular')
	end
	#segundo tipo de scope
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on rails')}
end
