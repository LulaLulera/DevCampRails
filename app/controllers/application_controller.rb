class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller? #se ejecuta antes de cualquier otra cosa, sin esto no nos permite los parametros a parte de email

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname])
	end
end 
