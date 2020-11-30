module ApplicationHelper
	# Los helpers son parecidos a los parciales, con la diferencia de que un helper esta en ruby y un parcial en HTML.
	# La funcionalidad de los helpers es para cuando necesitamos tener algun condicional lógico, la lógica debe ir SIEMPRE fuera de las vistas
	# Y no en una parcial, sino en el helper. Son buenas prácticas.
	# Si la mayoría del código es Ruby, haremos un helper, si es HTML haremos una vista parcial.
	# Dentro de cada método podemos incluir códgio HTML, y en la vista se pone el nombre del método 

	def login_helper style = '' 
	#por defecto esta un string vacío, con esto evitamos bugs, y tener que añadir este parámetro siempre que llamemos al método aunque no queramos dar ningún estilo
		# en la vista <%= login_helper %>
		unless current_user.is_a?(GuestUser)
	      link_to "Cerrar sesión", destroy_user_session_path, method: :delete, class: style
	    else
	      (link_to "Iniciar Sesión", new_user_session_path, class: style) + " ".html_safe +
	      (link_to "Registro", new_user_registration_path, class: style)
	    end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name}"
	      	content_tag(:p, greeting, class: "source-greating")
	    end
	end

	def copyright_generator
	  DevCampViewTool::Rendered.copyright 'Jordan Hudgens', 'All rights reserved'
	end

	def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  # def alerts
  #   alert = (flash[:alert] || flash[:error] || flash[:notice])

  #   if alert
  #     alert_generator alert
  #   end
  # end

  # def alert_generator msg
  #   js add_gritter(msg, title: "Jordan Hudgens Portfolio", sticky: false)
  # end
end
