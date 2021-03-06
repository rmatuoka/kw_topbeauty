class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method :current_user
  def navegadorie6
    if browser.ie6?
      redirect_to atualizar_index_path
    end 
  end
     
  private
  
  def current_user_session
   return @current_user_session if defined?(@current_user_session)
   @current_user_session = UserSession.find
   end

   def current_user
   return @current_user if defined?(@current_user)
   @current_user = current_user_session && current_user_session.record
   end
   
   rescue_from 'Acl9::AccessDenied', :with => :access_denied
   
   def access_denied
     if current_user
       flash[:temerro] = " "
       flash[:error] = 'Você não tem permissão para acessar está página!'
       redirect_to login_path       
     else
       flash[:temerro] = " "
       flash[:error] = 'Acesso negado. Você precisa estar logado.'
       redirect_to login_path
     end
   end
   
   def load_banners
      @banner = Banner.first(:order => "RAND()")
      @lines = Line.all
      #.sqlCommand("SELECT * FROM lines WHERE ")
      
      #ESMALTE DO DIA
      #cookies.delete :daily
      
      if cookies[:daily].blank?
        @Daily =  Color.first(:conditions => ["tip IS NOT NULL"], :order => "RAND()")
        cookies[:daily] = { :value => @Daily.id, :expires => 12.hour.from_now }
      else
        @Daily = Color.find(cookies[:daily].to_i)
      end
   end
end
