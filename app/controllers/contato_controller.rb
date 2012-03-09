class ContatoController < ApplicationController
layout "fancybox"

  def index
	@contato = Contact.new(:receive => true)
  end

  def create
    @contato = Contact.new(params[:contact])
	if (@contato.contact_type == "1".to_i || @contato.contact_type == "2".to_i)
		if @contato.save
		  flash[:notice] = "Enviado com sucesso."
		  redirect_to :action => 'index' 
		  
		  #ENVIA O EMAIL
		  
		  UserMailer.contact(@contato).deliver
		else
		  render :action => 'index'
		end
	else
		flash[:notice] = "Ocorreu um erro tente novamente !"
		redirect_to :action => 'index'
	end
  end

end
