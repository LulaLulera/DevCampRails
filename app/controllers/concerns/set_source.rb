module SetSource
	extend ActiveSupport::Concern
	
	included do
		before_action :set_source
	end

	#Este método nos permite acceder a los parametros de sesion que venga por ejemplo de otra página
	def set_source
		session[:source] = params[:q] if params[:q]
	end
end
