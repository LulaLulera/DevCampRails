class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include DeviseWhitelist
	before_action :set_source

	#ESte método nos permite acceder a los parametros de sesion que venga por ejemplo de otra página
	def set_source
		session[:source] = params[:q] if params[:q]
	end
end 
