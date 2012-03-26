class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL <cnascimento@korewa.com.br>"
  
  def contact (contato)
      @contact= contato
      mail(:to => "sac@topbeauty.com.br",:bcc => "sac@topbeauty.com.br", :subject => "Contato via Site")	
  end
  
  def t_conosco(contato)
      @contact= contato 
	  attachments[@contact.curriculum_file_name] = File.read(@contact.curriculum.path) 
      mail(:to => "sac@topbeauty.com.br",:bcc => "sac@topbeauty.com.br", :subject => "Contato via Site")
  end	
end
