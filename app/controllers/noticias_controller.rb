class NoticiasController < ApplicationController


  def index
  	@noticias=Post.all
  	render :layout => "internal_center"
  end 
  
  def show
    @noticia = Post.find(params[:id])
  end

end
