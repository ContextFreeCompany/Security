#Teste da Classe SHA256

require_relative 'SHA256'

sha = SHA256.new "Giovani Ferreira"

puts sha.hash

puts sha == "Giovani Ferreira"

puts sha.prepareForSave