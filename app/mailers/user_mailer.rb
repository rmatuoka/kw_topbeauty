class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL<teste@korewa.com.br>"
  
  def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
	
end
