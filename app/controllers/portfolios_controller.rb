class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new

    # esto instancia 3 versiones de este portfolio_item, y crea 3 tipos de technologies, es decir, en el form
    #habrá 3 elementos para añadir tecnologías
    3.times { @portfolio_item.technologies.build } 
  end

  def create
      @portfolio_item = Portfolio.new(portfolio_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        else
          format.html { render :new }
        end
      end
  end

  private

    # Only allow a list of trusted parameters through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attribute: [:name])
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

end
