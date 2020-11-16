module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user #sobreescribimos el método current_user, asi evitamos tener que poner condicionales en las vistas por ejemplo con un guest user
		#Si exite current_user, el comprtamiento es el mismo que si no hubieramos sobreescrito el método
		#en caso contrario utilizamos el Null Object Pattern, para ello usamos "OpenStruct"
		#El tipo de clase de current_user solo puede ser de tipo User o de tipo OpenStruct para poder hacer la distinción entre ambos
		super || guest_user
	end

	def guest_user
		OpenStruct.new(complete_name: "Guest User", 
					   first_name: "Guest", l
					   last_name: "User", 
					   email: "guest@guest.es"
					   )
	end

end