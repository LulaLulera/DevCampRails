module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user #sobreescribimos el método current_user, asi evitamos tener que poner condicionales en las vistas por ejemplo con un guest user
		#Si exite current_user, el comprtamiento es el mismo que si no hubieramos sobreescrito el método
		#en caso contrario utilizamos el Null Object Pattern, para ello usamos "OpenStruct"
		#El tipo de clase de current_user solo puede ser de tipo User o de tipo OpenStruct para poder hacer la distinción entre ambos
		super || guest_user
	end

	def guest_user
		# Creamos un usuario real para un usuario invitado, para evitar problemas con Petergate. 
		# Para ello creamos un nuevo modelo guest_user, no hace falta una tabla, pero va a heredar todo de la clase user
		# En este método lo que hacemos es crear un nuevo guest user
		guest = GuestUser.new
		guest.complete_name = "Guest User"
		guest.first_name = "Guest"
		guest.last_name = "User"
		guest.email = "guest@guest.es"

		guest #ESto es el return
	end

end