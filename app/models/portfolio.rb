class Portfolio < ApplicationRecord
	has_many :technologies

	################################################
	#esto nos permite acceder a los atributos de technologies desde portfolio.
	#En este caso le estamos diciendo que acepte este atributo si el nombre está en blanco
	#De esta manera cuando creemos un portfolio y no incluyamos ninguna tecnologia, no se creará ningún registro,
	# pero si completamos el apartado, se creará un nuevo registro "Technology"
	#para comprobar que esto funciona, en la consola: 
	# Portfolio.create!(title: "Web app", subtitle: "any", body: "aksjdhaks", 
	# technologies_attributes: [{name: 'Ruby'}, {name: 'Rails'}, {name: 'Angular'}, {name: 'Ionic'}])
	accepts_nested_attributes_for :technologies,
								  reject_if: lambda { |attrs| attrs['name'].blank?}

	################################################

	include Placeholder #incluimos el concern
	validates_presence_of :title, :body, :main_image, :thumb_image #validación para que estos campos sean obligatorios

	################################################
	#Para añadir los valores por defecto, es decir, antes de crear el item completa esos valores
	#antes de iniciar, es decir antes de new.
	after_initialize :set_defaults 
	################################################

	########################scopes########################
	#un tipo de scope
	def self.angular
		where(subtitle: 'Angular')
	end
	#segundo tipo de scope
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on rails')}
	#####################################################

	def set_defaults
		## Si en vez de usar ||= usamos =, si por ejemplo estamos en edit y ya tiene estos valores
		##los sobreescribe, pero así no, solo lo rellena si el valor es nil
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '352', width: '200')
	end
end
