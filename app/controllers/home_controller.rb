class HomeController < ApplicationController
layout "home"
  def index
	@noticias = Post.all(:limit => 3)
  end

end
