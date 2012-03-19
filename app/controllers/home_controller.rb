class HomeController < ApplicationController
  before_filter :load_banners
  layout "home"
  def index
	@noticias = Post.all(:limit => 3)
  end

end
