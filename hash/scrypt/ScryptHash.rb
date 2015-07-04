#Scrypt implementation

#Faz a requisição da gema do scrypt
require 'scrypt'

#Início da classe SCryptHash ---- Utilizar modulos????
class ScryptHash

	#hash produzido pela gema
	attr_accessor :hash

	#Poder ser iniciado com um hash ou com a senha digitada, transforma a senha em um hash
	def initialize password
		#Tenta recuperar as informações de um determinado hash
		begin
			#Precisei usar a variavel auxiliar pq caso ele falhasse aqui, a proxima parte ficava impedida
			#de escrever na mesma variavel (não sei pq) Perguntar depois
			aux = SCrypt::Password.new(password)
			@hash = aux
		#caso falhe, é pq o hash não é valido (é um texto plano). Então cria-se um novo hash
		rescue
			#Cria um novo hash baseado no texto plano
			@hash = SCrypt::Password.create(password)
		end
	end

	#Abstração da comparação fornecida pela gema --- Verificar utilidade
	def ==(toCompare)
		#chama a função que compara da gema
		return @hash == toCompare
	end
	alias_method :is_password?, :==		#Atribui diferentes nomes ao metodo

	#Pensado para retornar todas as informações referente ao hash
	def prepareForSave
		#Retorna um hash map com o nome do algoritmo e o hash
		return {:algorithm => "scrypt", :secret => @hash}
	end

end