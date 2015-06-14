#Implementação do algoritmo SHA512

require 'digest'

class SHA512

	#Atributos da classe
	attr_accessor :hash, :salt

	#construtor recebendo como parametro o texto e o salt é opcional
	def initialize text, salt = nil
		#caso o salt seja nulo gera-se um salt aleatorio
		@salt = salt ||= geraSalt
		#Se o texto passado não for um hash valido, gera-se um novo hash
		isValidHash(text) ? @hash = text : @hash = Digest::SHA512.hexdigest(@salt + text)
	end

	#Função para comparar o que foi digitado com o hash
	def ==(toCompare)
		return true if Digest::SHA512.hexdigest(@salt + toCompare) == @hash
		return false
	end
	alias_method :is_password?, :==	#Define um segundo nome pra função de comparar
 
	#Pensado para retornar todas as informações referente ao hash
	def prepareForSave
		#Retorna um hash map com o nome do algoritmo e o hash
		return {:algorithm => "sha512", :secret => @hash, :salt => @salt}
	end

	#Funções privadas
	private

	#Essa função existe para poupar a requisição de código, só faz a requisição se for necessario
	def geraSalt
		require 'openssl'
		#retorna um conjunto aleatorio de 32 bytes
		return OpenSSL::Random.random_bytes(32).unpack('H*').first.rjust(16,'0')
	end

	#Verifica se um dado hash é um hash SHA256
	def isValidHash? hash
		return hash.match("[a-fA-F0-9]{40}") != nil
	end
	alias_method :isValidHash, :isValidHash? #atribui ao método isValidHash? um nome alternativo

end