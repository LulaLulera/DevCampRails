module ApplicationHelper
	# Los helpers son parecidos a los parciales, con la diferencia de que un helper esta en ruby y un parcial en HTML.
	# La funcionalidad de los helpers es para cuando necesitamos tener algun condicional lógico, la lógica debe ir SIEMPRE fuera de las vistas
	# Y no en una parcial, sino en el helper. Son buenas prácticas.
	# Si la mayoría del código es Ruby, haremos un helper, si es HTML haremos una vista parcial.
	# Dentro de cada método podemos incluir códgio HTML, y en la vista se pone el nombre del método 

	def login_helper
		# en la vista <%= login_helper %>
		if current_user.is_a?(User) 
	      link_to "Logout", destroy_user_session_path, method: :delete
	    else
	      (link_to "Login", new_user_session_path) + "<br>".html_safe +
	      (link_to "Sign In", new_user_registration_path)
	    end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name}"
	      	content_tag(:p, greeting, class: "source-greating")
	    end
	end
end
