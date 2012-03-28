class UserMailer < ActionMailer::Base
  default :from => "Top Beauty <site@topbeauty.com.br>"
  
  def contact (contato)
      @contact= contato
      mail(:to => "sac@topbeauty.com.br",:bcc => "sac@topbeauty.com.br", :subject => "Contato via Site",:reply_to => contato.email)	
  end
  
  def t_conosco(contato)
      @contact= contato 
	  attachments[@contact.curriculum_file_name] = File.read(@contact.curriculum.path) 
      mail(:to => "sac@topbeauty.com.br",:bcc => "sac@topbeauty.com.br", :subject => "Currículo",:reply_to => contato.email)
  end	
end
