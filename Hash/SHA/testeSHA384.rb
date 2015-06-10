#Teste da classe SHA384

require_relative 'SHA384'

sha = SHA384.new "Giovani Ferreira"

puts sha.hash

puts sha.is_password? "Giovani Ferreira"

puts sha.prepareForSave