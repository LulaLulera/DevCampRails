class Blog < ApplicationRecord
	belongs_to :topic, optional: true #tiene una relación con topics

	enum status: {draft: 0, published: 1}
	#Blog.first.published! y automáticamente nos cambia el estado a published
	#Blog.published? y nos dirá los blogs con este status
	#Blog.published.count y nos dirá el número de blogs con este estatus

	extend FriendlyId
  	friendly_id :title, use: :slugged 
  	#esto hace que AUTOMÁTICAMENTE le de un friendly-id basado en el titulo del blog

  	validates_presence_of :title, :body #no nos permite crear un blog sin estos datos, también para editar
end
