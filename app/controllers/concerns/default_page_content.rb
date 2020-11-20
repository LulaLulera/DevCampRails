module DefaultPageContent
	extend ActiveSupport::Concern

	included  do 
		before_action :set_page_defaults
	end

	## Método que cambia dinámicamente el <title> en función de la página en la que estemos y otros valores por defecto
	def set_page_defaults
		# esta es una variable de instancia, es decir, esta variable es visible en todas partes del alcance del objeto. Es como una propiedad del objeto
		# Esta variable se cambiara en cada controlador de cada objeto
		@page_title = "Devcamp Portfolio | My Portfolio Website"

		##Con esta etiqueta meta los administradores tienen la posibilidad de definir palabras clave para el buscador. Las keywords 
		##son aquellos criterios a los que responde un buscador para ofrecerle al usuario páginas HTML como respuesta, donde tales palabras clave son parte de los meta tags
		@seo_keywords = 'Laura Blanco Portfolio'
	end


end