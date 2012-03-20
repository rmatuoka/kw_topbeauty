class Assistente::EstiloController < ApplicationController
  layout "blank"
  def index
    
  end
  
  def pergunta1
    session[:t] = 0
    session[:e] = 0
    session[:r] = 0
    session[:o] = 0
  end
  
  def pergunta2
    case params[:option]
    when "t"
      session[:t] = session[:t].to_i + 1
    when "e"
      session[:e] = session[:e].to_i + 1
    when "r"
      session[:r] = session[:r].to_i + 1
    when "o"
      session[:o] = session[:o].to_i + 1
    else
    
    end
  end
  
  def pergunta3
    case params[:option]
    when "t"
      session[:t] = session[:t].to_i + 1
    when "e"
      session[:e] = session[:e].to_i + 1
    when "r"
      session[:r] = session[:r].to_i + 1
    when "o"
      session[:o] = session[:o].to_i + 1
    else
    
    end
  end
  
  def pergunta4
    case params[:option]
    when "t"
      session[:t] = session[:t].to_i + 1
    when "e"
      session[:e] = session[:e].to_i + 1
    when "r"
      session[:r] = session[:r].to_i + 1
    when "o"
      session[:o] = session[:o].to_i + 1
    else
    
    end
  end
  
  def pergunta5
    case params[:option]
    when "t"
      session[:t] = session[:t].to_i + 1
    when "e"
      session[:e] = session[:e].to_i + 1
    when "r"
      session[:r] = session[:r].to_i + 1
    when "o"
      session[:o] = session[:o].to_i + 1
    else
    
    end
  end
  
  def resposta
    case params[:option]
    when "t"
      session[:t] = session[:t].to_i + 1
    when "e"
      session[:e] = session[:e].to_i + 1
    when "r"
      session[:r] = session[:r].to_i + 1
    when "o"
      session[:o] = session[:o].to_i + 1
    else
    
    end
    
    @timida = session[:t]
    @extrovertida = session[:e]
    @romantica = session[:r]
    @ousada = session[:o]
    
    @isTimida = false
    @isExtrovertida = false
    @isRomantica = false
    @isOusada = false
    
    if @timida > 2
      @isTimida = true
    elsif @extrovertida > 2
      @isExtrovertida = true
    elsif @romantica > 2
      @isRomantica = true
    elsif @ousada > 2
      @isOusada = true
    else
      if @timida == 2
        @isTimida = true
      elsif @extrovertida == 2
        @isExtrovertida = true
      elsif @romantica == 2
        @isRomantica = true
      elsif @ousada == 2
        @isOusada = true
      end
    end
    
    if @isTimida
      @tweet = "Eu sou Tímida! Faça você também o teste! http://www.topbeauty.com.br"
      @titulo = "Você é Tímida!"
      @chamada = "Fica na sua"
      @texto = "Olá, agora que eu já conheço um pouco mais sobre você, posso dizer que seu perfil é de uma pessoa Tímida. Você está sempre na sua, não gosta de contato com grandes multidões, é discreta e adora estar entre amigos mais próximos. Os esmaltes que combinam com você são: "
    elsif @isExtrovertida
      @tweet = "Eu sou Extrovertida! Faça você também o teste! http://www.topbeauty.com.br"
      @titulo = "Você é Extrovertida!"
      @chamada = "Luz, holofotes, animação!"
      @texto = "Sempre com os amigos, é quem agita a galera pra sair. Comunicativa e animada você é sempre destaque. Por ser o centro das atenções, os esmaltes que mais empolgam você são:"
    elsif @isRomantica
      @tweet = "Eu sou Romântica! Faça você também o teste! http://www.topbeauty.com.br"
      @titulo = "Você é Romântica!"
      @chamada = "Ahhhhh, o amor!"
      @texto = "Para você o que tem valor na vida são as pequenas coisas, os gestos de carinho e os sentimentos verdadeiros. Sempre em busca do príncipe encantado, idealiza o homem perfeito, que faz de tudo para agradar sua parceira. Seu perfil Romântico pede esmaltes assim: "
    elsif @isOusada
      @tweet = "Eu sou Ousada! Faça você também o teste! http://www.topbeauty.com.br"
      @titulo = "Você é Ousada!"
      @chamada = "Tô na área!"
      @texto = "Você não tem medo de correr riscos, é ágil, prática e corajosa ao resolver qualquer situação que possa surgir em seu caminho. Nos relacionamentos, o que vale é arriscar, provocar e inovar. Seu perfil é de garota Ousada e no quesito esmaltes, estes são a sua cara: "
    end
    
  end
end
