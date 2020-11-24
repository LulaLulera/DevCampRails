class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent

	before_action :set_copyright

	def set_copyright
		@copyright= DevCampViewTool::Rendered.copyright 'Laura Blanco', 'All rights reserved'
	end
end 

module DevCampViewTool
	class Rendered
		def self.copyright name, msg
			"&copy; #{Time.now.year}  |  <b>#{msg}".html_safe
		end
	end
end
