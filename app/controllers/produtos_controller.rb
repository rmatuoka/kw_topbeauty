class ProdutosController < ApplicationController
  layout "internal_center", :except => :show
  def index
	  @lines = Line.all
  end

  def show
  end

end
