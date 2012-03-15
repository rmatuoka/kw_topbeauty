class ProdutosController < ApplicationController
  layout "internal_center"
  def index
	@lines = Line.all
  end

  def show
	@line = Line.find(params[:id])
	@categories = @line.categories.all	
  end

end
