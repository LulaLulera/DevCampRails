class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout 'portfolio'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all #gestión de roles petergate

  
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

  def edit
    
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  private
    # Only allow a list of trusted parameters through. White list
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        technologies_attributes: [:name]
                                        )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

end
