class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

	  # Include default devise modules. Others available are:
	  # :confirmable (para cuando es necesario confirmar que es un humano, recibe un email de confirmación), 
	  # :lockable (poder bloquear un usuario, número de veces que intenta acceder),
	  # :timeoutable (tiempo en el que se desloguea aunque esté en la app),  and 
	  # :omniauthable (integra otros logueos como por ejemplo facebook o google)
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates_presence_of :name, :surname


    #Esto va a crear un atributo virtual "complete_name"
    def complete_name
     	self.name.to_s + " " + self.surname.to_s 
    end

end
