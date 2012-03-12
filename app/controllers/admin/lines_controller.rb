class Admin::LinesController < ApplicationController
  access_control do
      allow :admin, :all
  end
  layout "inadmin"
  
  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])
    if @line.save
      redirect_to [:admin, @line], :notice => "Successfully created line."
    else
      render :action => 'new'
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update_attributes(params[:line])
      redirect_to [:admin, @line], :notice  => "Successfully updated line."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    redirect_to admin_lines_url, :notice => "Successfully destroyed line."
  end
end
