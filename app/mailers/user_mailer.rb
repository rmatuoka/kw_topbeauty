class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL <cnascimento@korewa.com.br>"
  
  def contact (contato)
      @contact= contato
      mail(:to => "cnascimento@korewa.com.br",:bcc => "cnascimento@korewa.com.br", :subject => "teste top beauty")	
  end
  
  def t_conosco(contato)
      @contact= contato 
	  attachments[@contact.curriculum_file_name] = File.read(@contact.curriculum.path) 
      mail(:to => "cnascimento@korewa.com.br",:bcc => "cnascimento@korewa.com.br", :subject => "teste top beauty")
  end	
end
