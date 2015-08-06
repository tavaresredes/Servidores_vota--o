require 'socket'
class Urna
  attr_reader :senha, :parcial, :candidato1, :candidato2, :candidato3, :user, :usuario, :retorno, :retvoto    
  def initialize()
	@retvoto = 0
    @candidato1 = "Paulo"
	@voto1 = 0
	@candidato2 = "Pedro"
	@voto2 = 0
	@candidato3 = "Ana"	
	@voto3 = 0
	@senha = 123
	@parcial = ""
  end  
   def list()
	@retlist = "1 "+"#{@candidato1}"+"#"+"2 "+"#{@candidato2}"+"#"+"3 "+"#{@candidato3}"
	return @retlist
   end
   
   def votar(comando)
	spliter = comando.split
	
	@retvoto = 0 #enquanto n votar certo, retorna 0
	if spliter[1].to_i == 1 then
		@retvoto = "ok"
		@voto1 = @voto1 + 1
	end
	if spliter[1].to_i == 2 then
		@retvoto = "ok"
		@voto2 = @voto2 + 1	
	end
	if spliter[1].to_i == 3 then
		@retvoto = "ok"
		@voto3 = @voto3 + 1	
	end
	puts @retvoto
	return @retvoto
	end
#####################################################
   def result(pass)
	spliter = pass.split
	if spliter[1].to_i == @senha then
	
		@parcial = "#{candidato1}"+" = "+"#{@voto1}"+"#"+"#{candidato2}"+" = "+"#{@voto2}"+"#""#{candidato3}"+" = "+"#{@voto3}"
		else @parcial = 0
		
	end
	puts @parcial
	return @parcial
   end
############################################################
end
#main ####################################################
system("clear")
porta = 2000
serverSocket = TCPServer.new(porta)
puts "Urna de votacao!"

####################################################
loop {
	clientSocket = serverSocket.accept #cliente conecta
######################################################
	Thread.new{
		file = Urna.new
		status = "ON"
######################################################
		while status == "ON" do #fecha quando client send END_SESSION (Comando EXIT)
			comando = clientSocket.gets.chomp # recebe comando via socket
			puts "comando recebido: #{comando}"
			spliter = comando.split
################################################################
			if spliter[0] == "candidatos?" then
				list = file.list()
				clientSocket.puts(list)
################################################################
		  		elsif spliter[0] == "votar" then
					votando = file.votar(comando)
					clientSocket.puts(votando)					
			end #fim if spliter[0] == candidatos?					
		
################################################################
			if spliter[0] == "resultado" then
				puts "entrou resultado"
				retresult = file.result(comando)
				puts retresult
				clientSocket.puts(retresult)
			end
		  		
###################################################################
			end #fim while
####################################################################
			} #fim thread
}#fim loop 
