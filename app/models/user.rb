class User < ApplicationRecord
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
