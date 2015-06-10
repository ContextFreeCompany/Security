#Implementação do SHA256, intenção de usar para integridade

require 'digest'

class SHA256

	#Atributos da classe
	attr_accessor :hash, :salt

	#construtor recebendo como parametro o texto e o salt é opcional
	def initialize text, salt = nil
		#caso o salt seja nulo gera-se um salt aleatorio
		@salt = salt ||= geraSalt
		puts text
		puts @salt
		@hash = Digest::SHA256.hexdigest @salt + text
	end

	#Função para comparar o que foi digitado com o hash
	def ==(toCompare)
		puts @salt, toCompare
		puts Digest::SHA256.hexdigest(@salt + toCompare)
		puts @hash
		return Digest::SHA256.hexdigest(@salt + toCompare) == @hash
	end
	alias_method :is_password?, :==	#Define um segundo nome pra função de comparar

	#Pensado para retornar todas as informações referente ao hash
	def prepareForSave
		#Retorna um hash map com o nome do algoritmo e o hash
		return {:algorithm => "sha256", :secret => @hash, :salt => @salt}
	end

	#Funções privadas
	private

	#Essa função existe para poupar a requisição de código, só faz a requisição se for necessario
	def geraSalt
		require 'openssl'
		#retorna um conjunto aleatorio de 32 bytes
		return OpenSSL::Random.random_bytes(32).unpack('H*').first.rjust(16,'0')
	end

end