class AddColumnsToPortfolio < ActiveRecord::Migration[6.0]
  def change
  	  	add_column :portfolios, :title, :string
	  	add_column :portfolios, :subtitle, :string
	  	add_column :portfolios, :body, :text
	  	add_column :portfolios, :main_image, :text
	  	add_column :portfolios, :thumb_image, :text
  end
end
