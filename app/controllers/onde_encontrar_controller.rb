class OndeEncontrarController < ApplicationController
  before_filter :load_states, :load_banners
  
  layout "application", :except => :popula_cidades
  
  def index
    
  end
  
  def load_states
    @Estados = Reseller.all(:conditions => "active =  true", :group => "state", :order => "state ASC")
  end
  
  def resultados
    #flash[:msg] = params[:pessoa][:estado] + params[:pessoa][:cidade]
    @Resultados = Reseller.all(:conditions => ['state = ? AND city = ? and active =  true', params[:pessoa][:estado], params[:pessoa][:cidade]])
    
    @retorno = ""
    
    @Resultados.each do |r|
      @retorno += "<div id='ond_um' class='onde'>"
      @retorno += "     <h3>#{r.name}</h3>"
      @retorno += "     <p>#{r.address}, #{r.number}</p>"
      @retorno += "     <p>#{r.city} - #{r.state}</p>"
      @retorno += "     <p>#{r.phone}</p>"
      @retorno += "</div>"
    end
  end

  def popula_cidades
    @Cidades = Reseller.all(:conditions => ['state = ? and active =  true', params[:estado]], :group => "city", :order => "city ASC")
    
  end
end
