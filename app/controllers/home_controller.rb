class HomeController < ApplicationController
  before_filter :load_banners
  layout "home"
  def index
	  @noticias = Post.all(:limit => 3)
  end
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      @erro = false
    else
      @erro = true 
    end
  end  
end
