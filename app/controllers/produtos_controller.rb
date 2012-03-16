class ProdutosController < ApplicationController
  layout "internal_center", :except => :rating
before_filter :force_request_format_to_html, :except => :colors
  def index
	@lines = Line.all
  end

  def show
	@line = Line.find(params[:id])
	@categories = @line.categories.all	
  end

  def colors
  	@color = Color.find(params[:cor])
    if @color.modern_total > 0
      @moderna = @color.modern / @color.modern_total
    else
      @moderna = 0
    end

    if @color.conservative_total > 0
      @conservadora = @color.conservative / @color.conservative_total
    else
      @conservadora = 0
    end  

    if @color.sexy_total > 0
      @sexy = @color.sexy / @color.sexy_total
    else
      @sexy = 0
    end  

    if @color.day_total > 0
      @dia = @color.day / @color.day_total
    else
      @dia = 0
    end 

    if @color.night_total > 0
      @noite = @color.night / @color.night_total
    else
      @noite = 0
    end 


  end

  def rating
	  @color = Color.find(params[:color_id])
    case params[:campo]
      when "conservadora"
        @color.conservative = @color.conservative + params[:value].to_f
        @color.conservative_total = @color.conservative_total + 1
      when "sexy"
        @color.sexy = @color.sexy + params[:value].to_f
        @color.sexy_total = @color.sexy_total + 1
      when "moderna"
        @color.modern = @color.modern + params[:value].to_f
        @color.modern_total = @color.modern_total + 1
      when "dia"
        @color.day = @color.day + params[:value].to_f
        @color.day_total = @color.day_total + 1
      when "noite"
        @color.night = @color.night + params[:value].to_f
        @color.night_total = @color.night_total + 1
      else
    end
    @color.save
    #"value"=>"2.5", "color_id"=>"5", "campo"=>"conservadora"
  end


private

def force_request_format_to_html
  request.format = :html
end
end
