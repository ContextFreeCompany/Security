#Secret Box Implementação

#Requirindo todos os controladores de algoritmos
require_relative "Hash/hashControl"

class SecretBox

	#Setando o padrão para os parametros, serve para deixar alguns parametro opcionais
	PARAMETROS_DEFAULT = {
		:algorithm => nil,
		:salt => nil
	}

	#instancia da classe gerenciadores de algoritmos
	attr_accessor :type

	#Quero dar suporte a digitar somente o tipo de algoritmo + senha (caso seja hash)
	#Verificar a necessidade de usar Threads aqui
	def initialize values = {:type => type, :secret => secret}
		#Lança uma exceção caso os parametros type e secret cheguem vazios
		raise "Algorithm Type or secret can't be null" if values[:type] == nil or values[:secret] == nil
		values = PARAMETROS_DEFAULT.merge(values)

		case values[:type].downcase
		when "hash"
			@type = HashControl.new :secret => values[:secret], :algorithm => values[:algorithm], :salt => values[:salt]
		when "crypt"
			puts "crypt selected"
		else
			#Lança uma exceção caso o tipo de algoritmo desejado não esteja disponível
			raise "Must be selected an valid algorithm type"
		end
	end

	#Para comparar o hash/cypher_text com outra coisa qualquer digitada
	def ==(toCompare)
		#chama a função que compara a senha (texto plano) com o hash
		return @type == toCompare
	end
	alias_method :is_equal?, :==		#atribui ao metodo o nome is_equal?

	#Retorna o hash ou o cypher_text
	def hash
		return @type.secret
	end
	alias_method :cypher_text, :hash  	#atribui ao metodo o nome cypher_text
	alias_method :secret, :hash 		#atribui ao metodo o nome secret

	#Informa o nome de algoritmo que está sendo utilizado pelo progrma
	def algorithmSelected
		return @type.algorithmInstance
	end
	alias_method :algorithm, :algorithmSelected

	#retorna o hashmap com todas as informações necessárias
	def prepareForSave	
		#faz a chamada do save da classe
		return @type.prepareForSave
	end

end