class Admin::CategoriesController < ApplicationController
  before_filter :load_line
  
  access_control do
      allow :admin, :all
  end
  
  layout "inadmin"   
  
  def index
    @categories = @line.categories.all
  end

  def show
    @category = @line.categories.find(params[:id])
  end

  def new
    @category = @line.categories.new
  end

  def create
    @category = @line.categories.build(params[:category])
    if @category.save
  
      redirect_to admin_line_category_path(@line, @category), :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = @line.categories.find(params[:id])
  end

  def update
    @category = @line.categories.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to admin_line_category_path(@line, @category), :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = @line.categories.find(params[:id])
    @category.destroy
    redirect_to admin_line_categories_path(@line), :notice => "Successfully destroyed category."
  end
  def load_line
    @line = Line.find(params[:line_id])
  end
end
