require 'socket'
#main
system("clear")
ip = 'localhost'
porta = 2000

socket = TCPSocket.new(ip, porta) 
status = socket 
################################################
	while status == socket do
		puts "Digite o comando desejado: candidatos?; votar n; resultado senha"		
		comando = gets.chomp #próprio client recebe comando
		spliter = comando.split
###############################################
		if comando == "candidatos?" then
			else
			if spliter[0] == "candidatos?" then
				puts "COMANDO candidatos? nao pode ter parametros!"
			end
		end
###############################################
		if comando == "candidatos?" then #Listar pronto #if 2
		  socket.puts(comando) #enviar o comando via socket
		  retcomando = socket.gets.chomp #recebe retrno cmndo envdo
		  puts retcomando #imprime resultado do comando
###############################################
	      elsif comando == "votar" then #relativo ao if 2
		  	puts "Comando votar sem parametros!"
		    else #relativo ao elsif do if 2	
		      if spliter[0] == "votar" then #Funcionando #if 3
			socket.puts(comando)
			retvotando = socket.gets.chomp
			puts retvotando		        
			  end #fim elsif relativo ao if 2
		end #fim if 2
###############################################
		if spliter[0] == "resultado" then
			socket.puts(comando)
			retresult = socket.gets.chomp
			puts retresult
		end
############################################### 	
		end #fim if 1
