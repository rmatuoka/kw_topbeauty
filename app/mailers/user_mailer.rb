class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL<teste@korewa.com.br>"
  
  def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
  def contato_duvidas_comercial
	
  end
  def trabalhe_conosco
	
  end	
end
