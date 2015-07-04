#Testes da classe MD5

require_relative 'MD5'

m = MD5.new "Giovani Ferreira"

# puts m.hash

m2 = MD5.new m.prepareForSave[:secret], m.prepareForSave[:salt]

puts m2 == 	"Giovani Ferreira"