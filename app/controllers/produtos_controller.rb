class ProdutosController < ApplicationController
  def index
	render :layout => "internal_center"
	@produtos=Post.all
  end

  def show
  end

end
