class TConoscoController < ApplicationController
layout "fancybox"

  def index
	@contato = Contact.new
  end

  def create
    @contato = Contact.new(params[:contact])
	@contato.contact_type = 3
	if @contato.save
		flash[:notice] = "Enviado com sucesso."
		redirect_to :action => 'index'
		UserMailer.t_conosco(@contato).deliver
	else
		flash[:notice] = "Ocorreu um erro tente novamente !"
		redirect_to :action => 'index'
	end
  end


end
