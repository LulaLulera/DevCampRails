module DeviseWhitelist
	#La parte en la que permitimos los parámetros de devise debe ser mejor aquí que en application controller, porque application controler
	#solo debe tener una única funcionalidad, que es controlar el resto de controladores
	# por lo que debemos crear un concern par apoder manejar los permisos de devise, aunque luego lo incluyamos en application, pero toda la lógica debe estar a parte
	extend ActiveSupport::Concern

	included  do 
		before_action :configure_permitted_parameters, if: :devise_controller? #se ejecuta antes de cualquier otra cosa, sin esto no nos permite los parametros a parte de email
	end

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname])
	end
end