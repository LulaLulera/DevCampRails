class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def something
  	@else = params[:something]
  	@another = params[:another_one]
  end
end
