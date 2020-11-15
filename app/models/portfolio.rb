class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image 

	########################
	#Para añadir los valores por defecto, es decir, antes de crear el item completa esos valores
	#antes de iniciar, es decir antes de new.
	after_initialize :set_defaults 
	########################

	##########SCOPES##############
	#un tipo de scope
	def self.angular
		where(subtitle: 'Angular')
	end
	#segundo tipo de scope
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on rails')}
	#############################

	def set_defaults
		## Si en vez de usar ||= usamos =, si por ejemplo estamos en edit y ya tiene estos valores
		##los sobreescribe, pero así no, solo lo rellena si el valor es nil
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
	end
end
