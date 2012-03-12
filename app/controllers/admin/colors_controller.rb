class Admin::ColorsController < ApplicationController
  access_control do
      allow :admin, :all
  end
  
  layout "inadmin" 
  before_filter :load_line 
  
  
  def index
    @colors = @product.colors.all
  end

  def show
    @color = @product.colors.find(params[:id])
  end

  def new
    @color = @product.colors.new
  end

  def create
    @color = @product.colors.build(params[:color])
    if @color.save
      redirect_to admin_line_category_product_color_path(@line, @category, @product, @color), :notice => "Successfully created color."
    else
      render :action => 'new'
    end
  end

  def edit
    @color = @product.colors.find(params[:id])
  end

  def update
    @color = @product.colors.find(params[:id])
    if @color.update_attributes(params[:color])
      redirect_to admin_line_category_product_color_path(@line, @category, @product, @color), :notice  => "Successfully updated color."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @color = @product.colors.find(params[:id])
    @color.destroy
    redirect_to admin_line_category_product_color_path(@line, @category, @product, @color), :notice => "Successfully destroyed color."
  end

  def load_line
    @line = Line.find(params[:line_id])
    @category = @line.categories.find(params[:category_id])
    @product = @category.products.find(params[:product_id])
  end
end
